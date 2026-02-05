import torch 
import torch.nn as nn
import torch.nn.functional as F


import math


class LSTM_Block(nn.Module):

    def __init__(self, input_size, hidden_size = 128,output_size = 32, num_layers = 1, dropout = 0.5):
        super(LSTM_Block, self).__init__()
        self.lstm = nn.GRU(input_size=input_size, hidden_size=hidden_size, num_layers=num_layers, batch_first=True, dropout=dropout)
        self.fc = nn.Linear(hidden_size, output_size)
        self.norm = nn.BatchNorm1d(output_size)


    def forward(self, x):
        output, hn = self.lstm(x)
        hn = hn[-1]
        out = self.fc(hn)
        out = self.norm(out) 
        out = F.relu(out)
        return out, hn


class SAM(nn.Module):
    def __init__(self, bias=False):
        super(SAM, self).__init__()
        self.bias = bias
        self.conv = nn.Conv2d(in_channels=2, out_channels=1, kernel_size=7, stride=1, padding=3, dilation=1, bias=self.bias)

    def forward(self, x):
        max = torch.max(x,1)[0].unsqueeze(1)
        avg = torch.mean(x,1).unsqueeze(1)
        concat = torch.cat((max,avg), dim=1)
        output = self.conv(concat)
        output = F.sigmoid(output) * x 
        return output 

class CAM(nn.Module):
    def __init__(self, channels, r):
        super(CAM, self).__init__()
        self.channels = channels
        self.r = r
        self.linear = nn.Sequential(
            nn.Linear(in_features=self.channels, out_features=self.channels//self.r, bias=True),
            nn.ReLU(inplace=True),
            nn.Linear(in_features=self.channels//self.r, out_features=self.channels, bias=True))

    def forward(self, x):
        max = F.adaptive_max_pool2d(x, output_size=1)
        avg = F.adaptive_avg_pool2d(x, output_size=1)
        b, c, _, _ = x.size()
        linear_max = self.linear(max.view(b,c)).view(b, c, 1, 1)
        linear_avg = self.linear(avg.view(b,c)).view(b, c, 1, 1)
        output = linear_max + linear_avg
        output = F.sigmoid(output) * x
        return output
    
class CBAM(nn.Module):
    def __init__(self, channels, r = 8):
        super(CBAM, self).__init__()
        self.channels = channels
        self.r = r
        self.sam = SAM(bias=False)
        self.cam = CAM(channels=self.channels, r=self.r)

    def forward(self, x):
        output = self.cam(x)
        output = self.sam(output)
        return output + x
    

class CrossAttentionFusion(nn.Module):
    def __init__(self, dim = 32, num_heads = 4):
        super().__init__()
        self.attn = nn.MultiheadAttention(embed_dim=dim, num_heads=num_heads, batch_first=True)
        # define matrix multiplication layer

        self.w_q = nn.Linear(dim, dim)
        self.w_k = nn.Linear(dim, dim)
        self.w_v = nn.Linear(dim, dim)


    def forward(self, f_cnn, f_rnn):

        # q = f_cnn.unsqueeze(1)
        # k = f_rnn.unsqueeze(1)
        # v = f_rnn.unsqueeze(1)

        q = f_cnn
        k = f_rnn
        v = f_cnn

        q = self.w_q(q)
        k = self.w_k(k)
        v = self.w_v(v)

        out, _ = self.attn(q, k, v)

        out = out.squeeze(1)

        return out

    


class AxialAttention(nn.Module):
    pass
    

class SA_Block(nn.Module):
    def __init__(self, C, N):
        super().__init__()

        self.Wa = nn.Conv2d(C, N, kernel_size=1)
        self.Wb = nn.Conv2d(C, N, kernel_size=1)
        self.Wg = nn.Conv2d(C, N, kernel_size=1)

        self.conv = nn.Conv2d(N, C, kernel_size=1)


        self.F = nn.Conv2d(C, C, kernel_size=1)

    def forward(self, X):

        # X shape : (b, C, H, W)  

        B, C, H, W = X.shape

        alpha = self.Wa(X)
        beta = self.Wb(X)
        gamma = self.Wg(X)


        alpha = alpha.view(B, -1, H*W).permute(0, 2, 1)
        beta = beta.view(B, -1, H*W)
        energy = torch.bmm(alpha, beta)
        attention = F.softmax(energy, dim=-1)

        gamma = gamma.view(B, -1, H*W)

        out = torch.bmm(gamma, attention.permute(0, 2, 1))

        out = out.view(B, -1, H, W)

        out = self.conv(out)

        P = self.F(X) + out

        return P
    

class AdapterDenoiser(nn.Module):
    def __init__(self, input_size, hidden_size=8, dropout_prob=0.5):
        super(AdapterDenoiser, self).__init__()

        self.down_proj = nn.Linear(input_size, hidden_size)

        self.norm1 = nn.BatchNorm1d(15)
        self.lrelu = nn.LeakyReLU()
        self.dropout1 = nn.Dropout(dropout_prob)
        
        self.nonlinearity = nn.Linear(hidden_size * 15, hidden_size * 15)
        
        self.norm2 = nn.BatchNorm1d(15)
        self.dropout2 = nn.Dropout(dropout_prob)
        
        self.up_proj = nn.Linear(hidden_size, input_size)

        self.hidden_size = hidden_size

    def forward(self, x):
        B, S, E = x.shape
        
        x = self.down_proj(x) 
        
        
        x = self.norm1(x)
        x = self.lrelu(x)
        
       
        x = self.dropout1(x)
        
       
        x = x.reshape(B, S * self.hidden_size)
        
       
        x = self.nonlinearity(x)  
        
       
        x = x.reshape(B, S, self.hidden_size)
        
        x = self.norm2(x)
        x = self.lrelu(x)
        x = self.dropout2(x)
        
        x = self.up_proj(x)

        return x
    

class NoiseAttention(nn.Module):
    def __init__(self, L = 50, K = 16, d = 64):
        super().__init__()
        self.in_proj = nn.Linear(L, d)
        self.memory = nn.Parameter(torch.randn(K, d))
        self.val_proj = nn.Linear(d, d)
        self.out_proj = nn.Linear(d, L)

    def forward(self, x):
        B, T, L = x.shape
        q = self.in_proj(x)
        attn_logits = torch.matmul(q, self.memory.t()) / (q.shape[-1] ** 0.5)
        attn = F.softmax(attn_logits, dim = -1)
        noise_latent = torch.matmul(attn, self.val_proj(self.memory))
        noise = self.out_proj(noise_latent)
        return noise

class Transformer_Block(nn.Module):
    def __init__(self, input_size, model_dim, num_heads, num_layers, dropout = 0.1, output_dim = 32):
        super().__init__()

        self.input_proj = nn.Linear(input_size, model_dim)

        encoder_layer = nn.TransformerEncoderLayer(d_model=model_dim, nhead=num_heads,
                                                    dropout=dropout, batch_first=True)
        
        self.transformer = nn.TransformerEncoder(encoder_layer, num_layers=num_layers)

        self.pool = nn.AdaptiveAvgPool1d(1)
        self.fc_out = nn.Linear(model_dim, output_dim)


    def forward(self, x):
        x = self.input_proj(x)
        x = self.transformer(x) # (B, S, E)
        # x = x.permute(0, 2, 1)
        # x = self.pool(x).squeeze(-1)
        x = self.fc_out(x)
        x = F.relu(x)
        # print(x.shape)
        return x
    


class Axial_attention(nn.Module):
    def __init__(self, input_size, num_heads, num_layers, dropout = 0.1):
        super().__init__()

        # self.input_proj = nn.Linear(input_size, model_dim)

        encoder_layer = nn.TransformerEncoderLayer(d_model=input_size, nhead=num_heads,
                                                    dropout=dropout, batch_first=True)
        
        self.row_transformer = nn.TransformerEncoder(encoder_layer, num_layers=num_layers)
        self.col_transformer = nn.TransformerEncoder(encoder_layer, num_layers=num_layers)
    

    def forward(self, x):
        # x shape: (b, ic, m , m )

        # do both row and column attention then add them

        b, ic, m, _ = x.shape
        # m is the length and ic is the feature 

        row_x = x.permute(0,2,1,3).contiguous().view(b*m, m, ic)
        row_out = self.row_transformer(row_x)
        row_out = row_out.view(b, m, ic, m).permute(0,2,1,3)

        col_x = x.permute(0,3,1,2).contiguous().view(b*m, m, ic)
        col_out = self.col_transformer(col_x)
        col_out = col_out.view(b, m, ic, m).permute(0,2,3,1)

        out = row_out + col_out
        return out


