import torch 
import torch.nn as nn
import torch.nn.functional as F

from modules import *

Conv2d = nn.Conv2d



def conv_block(in_channels, out_channels, kernel_size, cnn_norm):
    if cnn_norm == 'instance_norm':
        norm = nn.InstanceNorm2d
    else:
        norm = nn.BatchNorm2d
    return nn.Sequential(
        Conv2d(in_channels=in_channels, out_channels=out_channels, kernel_size=kernel_size, bias=False),
        norm(out_channels),
        nn.ReLU(),
    )



class BasicTransformer(nn.Module):
    def __init__(self, args, hidden_dim=16, num_layers=2, nhead=1):
        super().__init__()

        self.segment_len = args.segment_length
        self.segment_num = args.segment_num
        self.sum_up_len = args.sum_up_length

        self.num_segments = 2 * self.segment_num + 1

        half_len = (self.segment_len + 1) // 2 + (self.segment_len + 1) % 2
        input_dim = half_len // self.sum_up_len

        self.input_proj = nn.Linear(input_dim, hidden_dim)

        self.max_len = 500
        self.hidden_dim = hidden_dim

        self.positional_encoding = nn.Parameter(torch.zeros(1, self.max_len, hidden_dim))

        encoder_layer = nn.TransformerEncoderLayer(
            d_model=hidden_dim,
            nhead=nhead,
            dim_feedforward=hidden_dim * 4,
            dropout=0.1,
            batch_first=True
        )
        self.transformer_encoder = nn.TransformerEncoder(
            encoder_layer, num_layers=num_layers
        )

        self.fc_out = nn.Linear(hidden_dim, 2)

        self.band_limits = [4, 8, 13, 30, 50, 70, 90, 110, 128]
        self.band_weights = nn.Parameter(torch.ones(len(self.band_limits) - 1))
    


    def differential_signed_min_max(self, x):
        B, C, N, M = x.shape

        A = x.unsqueeze(-2)
        Bv = x.unsqueeze(-3)
        diff = A - Bv # (B, C, N, N, M)

        neg = diff < 0
        abs_diff = torch.abs(diff).view(B, C, -1, M)
        max_val, _ = torch.max(abs_diff, dim=-2)
        max_val = max_val.unsqueeze(-2)

        norm = abs_diff / (max_val + 1e-8)
        norm = norm.view(B, C, N, N, M)
        norm[neg] *= -1

        return diff.permute(0, 1, 4, 2, 3)

    def forward(self, x, p=None):
        B, C, N = x.shape[0], x.shape[1], self.num_segments

        b, c, t = x.size()
        x = x.view(b, c, -1, self.segment_len)
        x = torch.log(torch.abs(torch.fft.rfft(x, dim=-1)) + 1)
        c_N = x.shape[-1]
        avai_c_N = c_N // self.sum_up_len * self.sum_up_len
        x = x[:, :, :, :avai_c_N].view(b, c, self.segment_num * 2 + 1, -1, self.sum_up_len).sum(dim=-1)

        x = self.differential_signed_min_max(x)

        x = x.permute(0, 1, 3, 4, 2).contiguous()

        x = x.view(B * C, N ** 2, -1)

        x = self.input_proj(x)

        seq_len = x.size(1)
        pos = self.positional_encoding[:, :seq_len, :].to(x.device)
        x = x + pos

        encoded = self.transformer_encoder(x)

        pooled = encoded.mean(dim=1)

        out = self.fc_out(pooled)

        return out.view(-1, 2)


class ConvolutionLayer(nn.Module):
    def __init__(self, in_c, h_c=64, cnn_norm='instance_norm', is_contextual=1, is_channel_level=1):
        super().__init__()
        self.channels = h_c
        self.is_contextual = is_contextual
        self.is_channel_level = is_channel_level
        self.conv0 = conv_block(in_c, self.channels * 2, (3, 3), cnn_norm=cnn_norm)
        self.conv1 = conv_block(self.channels * 2, self.channels * 2, (3, 3), cnn_norm=cnn_norm)
        self.conv2 = conv_block(self.channels * 2, self.channels * 2, (3, 3), cnn_norm=cnn_norm)
        self.conv3 = nn.Conv2d(self.channels * 2, self.channels * 2, (1, 2), bias=False)

        self.transform = nn.Sequential(
            nn.AdaptiveAvgPool2d(output_size=(1, 1)),
            nn.Flatten()
        )

    def forward(self, x):
        o0 = F.max_pool2d(self.conv0(x), kernel_size=(2, 2))
        o1 = F.max_pool2d(self.conv1(o0), kernel_size=(2, 2))
        if self.is_channel_level == 1 and self.is_contextual == 1:
            o2 = self.transform(self.conv3(o1))

        o0 = self.transform(o0)
        o1 = self.transform(o1)

        if self.is_channel_level == 1 and self.is_contextual == 1:
            o = torch.cat([o0, o1, o2], dim=-1)
        else:
            o = torch.cat([o0, o1], dim=-1)
        return o


class DMNet(nn.Module):
    def __init__(self, args):
        super().__init__()
        self.segment_length = args.segment_length
        self.segment_num = args.segment_num
        self.sum_up_length = args.sum_up_length
        self.is_contextual = args.is_contextual
        self.is_channel_level = args.is_channel_level
        self.is_cnn = args.is_cnn
        self.is_dm = args.is_dm
        self.is_fr = args.is_fr
        self.ratio = args.ratio
        c_N = (args.segment_length+1) // 2 + (args.segment_length+1) % 2
        in_c = c_N // self.sum_up_length
        if args.diff_norm == 'min_max':
            if args.diff_sign == 1:
                self.differential = self.differential_signed_min_max
            else:
                self.differential = self.differential_abs_min_max
        else:
            self.differential = self.differential_std_norm
        self.cnn = ConvolutionLayer(in_c=in_c, h_c=args.h_c, cnn_norm=args.cnn_norm, is_contextual=args.is_contextual, is_channel_level=args.is_channel_level)
        self.k = args.k
        
        
        if self.is_channel_level == 1 and self.is_contextual == 1:
            self.fc = nn.Sequential(
                nn.Linear(in_features=args.h_c*2*3, out_features=2),
            )
        else:
            self.fc = nn.Sequential(
                nn.Linear(in_features=args.h_c*2*2, out_features=2),
            )        
        
    @staticmethod
    def differential_signed_min_max(x):
        """
            b: batch_size
            c: channel_num
            m: segment_num
            n: feature_dim
        """
        b, c, m, n = x.shape
        A = torch.unsqueeze(x, dim=-2)
        B = torch.unsqueeze(x, dim=-3)
        val = A - B # (b, c, m, m, n)
        neg = val < 0
        abs_c = torch.abs(val).view(b, c, -1, n)
        max_val, _ = torch.max(abs_c, dim=-2)
        max_val = torch.unsqueeze(max_val, dim=-2)
        norm_val = abs_c / max_val
        norm_val = norm_val.view(b, c, m, m, -1)
        norm_val[neg] *= -1
        norm_val = norm_val.permute(0, 1, 4, 2, 3)
        return val.permute(0, 1, 4, 2, 3)
    # 7500 -> 15 * 500 -> 15 * 251 -> 15 * 50

    def cal_metrics(self, x):
        b, c, t = x.size()
        x = x.view(b, c, -1, self.segment_length)
        x = torch.log(torch.abs(torch.fft.rfft(x, dim=-1)) + 1)
        c_N = x.shape[-1]
        avai_c_N = c_N // self.sum_up_length * self.sum_up_length
        x = x[:, :, :, :avai_c_N].view(b, c, self.segment_num * 2 + 1, -1, self.sum_up_length).sum(dim=-1)
        return x
    

    def forward(self, x, gs):
        b, c = x.shape[0], x.shape[1]
        gs = gs.float()

        metrics = self.cal_metrics(x)

        N  = 2 * self.segment_num + 1


        if self.is_contextual == 0:
            metrics = metrics[:, :, self.segment_num * 2, :].unsqueeze(2)

        if self.is_channel_level == 1:
            metrics = torch.cat([gs[:, :, :(self.k - 1), :], metrics, gs[:, :, -(self.k - 1):, :]], dim=2)

        diff_images = self.differential(metrics)

        _, _, ic, m, m = diff_images.size()

        if self.is_cnn == 1:

            diff_images = diff_images.view(-1, ic, m, m)

            if self.is_channel_level == 1 and self.is_contextual == 1:
                cnn_hidden = self.cnn(diff_images[:, :, (self.k - 1):-(self.k - 1), :])
            else:
                cnn_hidden = self.cnn(diff_images)

            cnn_hidden = cnn_hidden.view(b, c, -1) # (256, 1, 32)


            logits = self.fc(cnn_hidden)

            return logits.view(b * c, -1)
        else:
            diff_images = diff_images.reshape(b * c, -1)
            logits = self.fc_no_cnn(diff_images)
            return logits
        