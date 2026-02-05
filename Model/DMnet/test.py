import math
import torch
import torch.nn as nn
import torch.nn.functional as F



class MultiHeadSelfAttentionWithLagBias(nn.Module):
    """
    Multi-head self-attention that adds a learned lag-based bias to the attention logits.
    lag: LongTensor of shape (seq_len,) giving K for each token position in the sequence.
    lag_bias: Parameter of shape (n_heads, max_lag+1) where lag_bias[h, d] = bias for |Kp-Kq| = d
    """
    def __init__(self, d_model, n_heads, max_lag):
        super().__init__()
        assert d_model % n_heads == 0
        self.d_model = d_model
        self.n_heads = n_heads
        self.d_k = d_model // n_heads

        self.q_proj = nn.Linear(d_model, d_model)
        self.k_proj = nn.Linear(d_model, d_model)
        self.v_proj = nn.Linear(d_model, d_model)
        self.out_proj = nn.Linear(d_model, d_model)

        # learned lag bias per head for differences 0..max_lag
        self.lag_bias = nn.Parameter(torch.zeros(n_heads, max_lag + 1))

    def forward(self, x, lag):
        # x: (B, S, D)
        B, S, D = x.shape
        device = x.device

        Q = self.q_proj(x).view(B, S, self.n_heads, self.d_k).transpose(1, 2)  # (B, H, S, d_k)
        K = self.k_proj(x).view(B, S, self.n_heads, self.d_k).transpose(1, 2)  # (B, H, S, d_k)
        V = self.v_proj(x).view(B, S, self.n_heads, self.d_k).transpose(1, 2)  # (B, H, S, d_k)

        # scores: (B, H, S, S)
        scores = torch.matmul(Q, K.transpose(-2, -1)) / math.sqrt(self.d_k)

        # build bias per head (H, S, S)
        # lag: (S,) long
        # compute |Kp - Kq|
        with torch.no_grad():
            lag = lag.to(device)
            ld = (lag.view(S, 1) - lag.view(1, S)).abs().long()  # (S, S)
        # index into lag_bias to get (H, S, S)
        bias = self.lag_bias[:, ld]  # (H, S, S)

        # expand bias to batch: (B, H, S, S)
        scores = scores + bias.unsqueeze(0)

        attn = torch.softmax(scores, dim=-1)  # (B, H, S, S)
        out = torch.matmul(attn, V)  # (B, H, S, d_k)
        out = out.transpose(1, 2).contiguous().view(B, S, D)  # (B, S, D)
        out = self.out_proj(out)
        return out


class TransformerEncoderBlockWithLagBias(nn.Module):
    def __init__(self, d_model=64, n_heads=4, dim_feedforward=None, dropout=0.1, max_lag=10):
        super().__init__()
        if dim_feedforward is None:
            dim_feedforward = d_model * 4
        self.attn = MultiHeadSelfAttentionWithLagBias(d_model, n_heads, max_lag)
        self.norm1 = nn.LayerNorm(d_model)
        self.ff = nn.Sequential(
            nn.Linear(d_model, dim_feedforward),
            nn.ReLU(),
            nn.Linear(dim_feedforward, d_model),
        )
        self.norm2 = nn.LayerNorm(d_model)
        self.dropout = nn.Dropout(dropout)

    def forward(self, x, lag):
        # x: (B, S, D)
        x2 = self.attn(x, lag)
        x = x + self.dropout(x2)
        x = self.norm1(x)
        x2 = self.ff(x)
        x = x + self.dropout(x2)
        x = self.norm2(x)
        return x


class PyramidTransformerGoh(nn.Module):
    def __init__(self, args, hidden_dim=64, num_layers=2, nhead=4):
        super().__init__()

        # user args (kept names from your original code)
        self.segment_len = args.segment_length
        self.segment_num = args.segment_num
        self.sum_up_len = args.sum_up_length

        self.num_segments = 2 * self.segment_num + 1
        max_span = max(1, self.num_segments // 2)
        self.spans = [i for i in range(1, max_span + 1)]
        self.max_span = max(self.spans)

        # compute input projection dims (same logic you had)
        half_len = (self.segment_len + 1) // 2 + (self.segment_len + 1) % 2
        input_dim = half_len // self.sum_up_len

        # projection from raw diff features to model dim
        self.input_proj = nn.Sequential(
            nn.Linear(input_dim, hidden_dim),
            nn.ReLU(),
            nn.Linear(hidden_dim, hidden_dim)
        )

        # optional: start pos embedding added to raw segment features BEFORE differencing
        # keep same size as input_dim (we add to the raw x prior to diff)
        self.start_pos_embedding = nn.Embedding(self.num_segments + 1, input_dim)

        # level embedding (tag tokens by lag)
        self.level_embedding = nn.Embedding(len(self.spans), hidden_dim)

        # stack of custom transformer blocks that accept lag vector
        blocks = []
        for _ in range(num_layers):
            blocks.append(TransformerEncoderBlockWithLagBias(
                d_model=hidden_dim,
                n_heads=nhead,
                dim_feedforward=hidden_dim * 4,
                dropout=0.1,
                max_lag=self.max_span
            ))
        self.blocks = nn.ModuleList(blocks)

        # after transformer over tokens, pool by K (we'll do mean+max per K and a projection)
        self.pool_proj = nn.Linear(hidden_dim * 2, hidden_dim)

        # small transformer (or MLP) over K-level tokens
        self.level_transformer = nn.TransformerEncoder(
            nn.TransformerEncoderLayer(d_model=hidden_dim, nhead=max(1, nhead // 2), batch_first=True),
            num_layers=1
        )

        self.fc_out = nn.Linear(hidden_dim, 2)
        self.hidden_dim = hidden_dim

    def create_pyramid_tokens(self, x):
        """
        Inputs:
            x: (B, C, N, M)  where M is freq-bins after sum_up
        Returns:
            tokens: (B*C, S, D)  S = total token count across all spans
            lag_vector: LongTensor (S,) giving K for each token position (same for all batch)
        """
        B, C, N, M = x.shape
        BC = B * C
        device = x.device

        # flatten batch & channels
        x = x.view(BC, N, M)  # (BC, N, M)

        # optionally add start pos embeddings to raw segment features (this is BEFORE diff)
        start_indices = torch.arange(N, device=device)
        start_indices = start_indices.unsqueeze(0).expand(BC, -1)  # (BC, N)
        # broadcast embedding to M-dim: embedding has input_dim size; ensure M matches input_dim
        # your code used input_dim == M after sum_up; assume that still holds
        x = x + self.start_pos_embedding(start_indices).unsqueeze(-1)  # (BC, N, M)

        all_tokens = []
        lag_list = []

        for level_idx, span in enumerate(self.spans):
            # compute differences for this span
            # diff shape: (BC, N-span, M)
            diff = x[:, span:, :] - x[:, :-span, :]

            # project to hidden dim
            tokens = self.input_proj(diff)  # (BC, N-span, D)

            # add level embedding (tag with scale)
            level_emb = self.level_embedding(torch.tensor(level_idx, device=device))  # (D,)
            tokens = tokens + level_emb.view(1, 1, -1)

            # do NOT add positional embeddings inside the group (we want permutation-invariance within K)
            # so we do not add start_pos_embedding here

            all_tokens.append(tokens)  # list of (BC, L_level, D)
            lag_list.append(torch.full((tokens.size(1),), fill_value=span, dtype=torch.long, device=device))

        # concatenate tokens along sequence dimension
        # combined_tokens: (BC, S, D)
        combined_tokens = torch.cat(all_tokens, dim=1)
        # single lag vector (S,) independent of batch (same for every batch)
        lag_vector = torch.cat(lag_list, dim=0)

        return combined_tokens, lag_vector

    def forward(self, x, p=None):
        # x: (b, c, total_time) similar to your original call
        b, c, t = x.size()
        # reshape into segments
        x = x.view(b, c, -1, self.segment_len)  # (b, c, N, segment_len)

        # FFT / frequency representation (keep your existing approach)
        x_fft = torch.fft.rfft(x, dim=-1)
        x = torch.log(torch.abs(x_fft) + 1)

        # sum_up step (same as your code)
        c_N = x.shape[-1]
        avai_c_N = c_N // self.sum_up_len * self.sum_up_len
        x = x[:, :, :, :avai_c_N].view(b, c, self.segment_num * 2 + 1, -1, self.sum_up_len).sum(dim=-1)
        # now x: (b, c, N, M)  where M == input_dim assumed earlier

        tokens, lag_vector = self.create_pyramid_tokens(x)  # tokens: (BC, S, D)

        # pass through transformer blocks with lag bias
        out = tokens
        for block in self.blocks:
            out = block(out, lag_vector)  # out stays (BC, S, D)

        # pool by K (lag)
        # lag_vector contains K value for each position in 0..max_span
        # build masks per K and compute mean+max for each K
        BC, S, D = out.shape
        device = out.device
        pooled_levels = []
        for span in self.spans:
            mask = (lag_vector == span)  # (S,)
            if mask.sum().item() == 0:
                # no tokens for this K (shouldn't happen normally), add zeros
                pooled = torch.zeros(BC, D * 2, device=device)
            else:
                selected = out[:, mask, :]  # (BC, L, D)
                mean = selected.mean(dim=1)  # (BC, D)
                # max along sequence dim:
                maxv, _ = selected.max(dim=1)  # (BC, D)
                pooled = torch.cat([mean, maxv], dim=-1)  # (BC, 2D)
            # project back to D
            pooled = self.pool_proj(pooled)  # (BC, D)
            pooled_levels.append(pooled.unsqueeze(1))  # list of (BC, 1, D)

        # stacked K-level tokens: (BC, K_levels, D)
        Z = torch.cat(pooled_levels, dim=1)

        # optional small transformer over levels (here batch_first True)
        Z = self.level_transformer(Z)  # (BC, K_levels, D)

        # pool across K-levels (mean)
        pooled = Z.mean(dim=1)  # (BC, D)

        logits = self.fc_out(pooled)  # (BC, 2)
        # return as (b, c, 2) flattened to (-1, 2) like your original
        return logits.view(-1, 2)