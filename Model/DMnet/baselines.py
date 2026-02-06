import torch 
import torch.nn as nn
import torch.nn.functional as F

from modules import *
import numpy as np

Conv2d = nn.Conv2d


class LSTMBaseline(nn.Module):
    def __init__(self, args):
        super().__init__()
        self.segment_length = args.segment_length
        self.segment_num = args.segment_num
        self.sum_up_length = args.sum_up_length
        
        # --- Calculate Input Dimension (Same logic as DMNet) ---
        # 1. FFT Length
        c_N = (args.segment_length + 1) // 2 + (args.segment_length + 1) % 2
        # 2. Binning/Summing length
        self.input_dim = c_N // self.sum_up_length
        
        # --- LSTM Architecture ---
        self.hidden_dim = 64  # You can make this an arg if needed
        self.num_layers = 1
        
        self.lstm = nn.LSTM(
            input_size=self.input_dim,
            hidden_size=self.hidden_dim,
            num_layers=self.num_layers,
            batch_first=True
        )
        
        # Output layer for binary classification
        self.fc = nn.Linear(self.hidden_dim, 2)

    def cal_metrics(self, x):
        """
        Exact copy of DMNet preprocessing to ensure fair baseline comparison.
        Extracts FFT segments from the raw time series.
        """
        b, c, t = x.size()
        x = x.view(b, c, -1, self.segment_length)
        x = torch.log(torch.abs(torch.fft.rfft(x, dim=-1)) + 1)
        c_N = x.shape[-1]
        avai_c_N = c_N // self.sum_up_length * self.sum_up_length
        x = x[:, :, :, :avai_c_N].view(b, c, self.segment_num * 2 + 1, -1, self.sum_up_length).sum(dim=-1)
        return x

    def forward(self, x, gs=None):
        # 1. Extract Features
        # x shape: (b, c, t) -> metrics shape: (b, c, seq_len, feature_dim)
        metrics = self.cal_metrics(x)
        
        b, c, seq_len, feat_dim = metrics.size()
        
        # 2. Reshape for LSTM
        # We treat every channel as an independent sequence, similar to DMNet output
        # Shape becomes: (b * c, seq_len, feature_dim)
        lstm_input = metrics.view(b * c, seq_len, feat_dim)
        
        # 3. LSTM Pass
        # output: (batch, seq_len, hidden_dim)
        # hn: (num_layers, batch, hidden_dim)
        lstm_out, (hn, cn) = self.lstm(lstm_input)
        
        # 4. Take the last hidden state for classification
        last_hidden = hn[-1] # Shape: (b * c, hidden_dim)
        
        # 5. Classification
        logits = self.fc(last_hidden) # Shape: (b * c, 2)
        
        return logits
    


class PositionalEncoding(nn.Module):
    def __init__(self, d_model, max_len=5000):
        super().__init__()
        # Create constant 'pe' matrix with values dependent on pos and i
        pe = torch.zeros(max_len, d_model)
        position = torch.arange(0, max_len, dtype=torch.float).unsqueeze(1)
        div_term = torch.exp(torch.arange(0, d_model, 2).float() * (-math.log(10000.0) / d_model))
        
        pe[:, 0::2] = torch.sin(position * div_term)
        pe[:, 1::2] = torch.cos(position * div_term)
        
        # Register as buffer (not a learnable parameter, but part of state_dict)
        self.register_buffer('pe', pe.unsqueeze(0))

    def forward(self, x):
        # x shape: (batch, seq_len, d_model)
        # Add positional encoding to input
        return x + self.pe[:, :x.size(1), :]

class TransformerBaseline(nn.Module):
    def __init__(self, args):
        super().__init__()
        self.segment_length = args.segment_length
        self.segment_num = args.segment_num
        self.sum_up_length = args.sum_up_length
        
        # --- Calculate Input Dimension ---
        c_N = (args.segment_length + 1) // 2 + (args.segment_length + 1) % 2
        self.input_dim = c_N // self.sum_up_length
        
        # --- Transformer Architecture ---
        self.d_model = 64  # Hidden dimension size
        self.nhead = 4     # Number of attention heads
        self.num_layers = 1
        self.dim_feedforward = 128 # FFN expansion factor
        
        # 1. Project regular input_dim to d_model size
        self.input_proj = nn.Linear(self.input_dim, self.d_model)
        
        # 2. Positional Encoding
        self.pos_encoder = PositionalEncoding(self.d_model)
        
        # 3. Transformer Encoder
        encoder_layer = nn.TransformerEncoderLayer(
            d_model=self.d_model, 
            nhead=self.nhead, 
            dim_feedforward=self.dim_feedforward, 
            batch_first=True
        )
        self.transformer_encoder = nn.TransformerEncoder(encoder_layer, num_layers=self.num_layers)
        
        self.fc = nn.Linear(self.d_model, 2)

    def cal_metrics(self, x):
        """Exact copy of DMNet preprocessing."""
        b, c, t = x.size()
        x = x.view(b, c, -1, self.segment_length)
        x = torch.log(torch.abs(torch.fft.rfft(x, dim=-1)) + 1)
        c_N = x.shape[-1]
        avai_c_N = c_N // self.sum_up_length * self.sum_up_length
        x = x[:, :, :, :avai_c_N].view(b, c, self.segment_num * 2 + 1, -1, self.sum_up_length).sum(dim=-1)
        return x

    def forward(self, x, gs=None):
        metrics = self.cal_metrics(x)
        b, c, seq_len, feat_dim = metrics.size()
        
        # Reshape: (b * c, seq_len, feature_dim)
        input_seq = metrics.view(b * c, seq_len, feat_dim)
        
        # 1. Project to d_model
        x_proj = self.input_proj(input_seq) # (Batch, Seq_len, d_model)
        
        # 2. Add Positional Encoding
        x_pos = self.pos_encoder(x_proj)
        
        # 3. Transformer Pass
        # Output shape: (Batch, Seq_len, d_model)
        trans_out = self.transformer_encoder(x_pos)
        
        # 4. Take the last token for classification
        # (Similar to taking the last hidden state in LSTM)
        last_token = trans_out[:, -1, :] 
        
        logits = self.fc(last_token)
        return logits
    
class GRUBaseline(nn.Module):
    def __init__(self, args):
        super().__init__()
        self.segment_length = args.segment_length
        self.segment_num = args.segment_num
        self.sum_up_length = args.sum_up_length
        
        # --- Calculate Input Dimension ---
        c_N = (args.segment_length + 1) // 2 + (args.segment_length + 1) % 2
        self.input_dim = c_N // self.sum_up_length
        
        # --- GRU Architecture ---
        self.hidden_dim = 64
        self.num_layers = 1
        
        self.gru = nn.GRU(
            input_size=self.input_dim,
            hidden_size=self.hidden_dim,
            num_layers=self.num_layers,
            batch_first=True
        )
        
        # Output layer
        self.fc = nn.Linear(self.hidden_dim, 2)

    def cal_metrics(self, x):
        """Exact copy of DMNet preprocessing."""
        b, c, t = x.size()
        x = x.view(b, c, -1, self.segment_length)
        x = torch.log(torch.abs(torch.fft.rfft(x, dim=-1)) + 1)
        c_N = x.shape[-1]
        avai_c_N = c_N // self.sum_up_length * self.sum_up_length
        x = x[:, :, :, :avai_c_N].view(b, c, self.segment_num * 2 + 1, -1, self.sum_up_length).sum(dim=-1)
        return x

    def forward(self, x, gs=None):
        metrics = self.cal_metrics(x)
        b, c, seq_len, feat_dim = metrics.size()
        
        # Reshape: (b * c, seq_len, feature_dim)
        gru_input = metrics.view(b * c, seq_len, feat_dim)
        
        # GRU Pass
        # output: (batch, seq_len, hidden_dim)
        # hn: (num_layers, batch, hidden_dim)
        # Note: GRU does not return a cell state (cn) like LSTM
        gru_out, hn = self.gru(gru_input)
        
        # Take the last hidden state for classification
        last_hidden = hn[-1] # Shape: (b * c, hidden_dim)
        
        logits = self.fc(last_hidden)
        return logits
    


# create a sigmoid where its Relu + clip(0,1)
    
class HardSigmoid(nn.Module):
    """
    Hardware-friendly sigmoid approximation using ReLU + clip.
    Forward: y = clip(alpha * x + 0.5, 0, 1)
    """
    def __init__(self, alpha=1.0):
        super().__init__()
        self.alpha = alpha

    def forward(self, x):
        return torch.clamp(torch.relu(self.alpha * x + 0.5), 0.0, 1.0)

class SpatialAttention(nn.Module):

    def __init__(self, kernel_size=7):
        super(SpatialAttention, self).__init__()
        assert kernel_size in (3, 7), 'kernel size must be 3 or 7'
        padding = 3 if kernel_size == 7 else 1
        self.conv1 = nn.Conv2d(2, 1, kernel_size, padding=padding, bias=False)
        # self.sigmoid = nn.Sigmoid()
        self.sigmoid = HardSigmoid(alpha=1.0)

    def forward(self, x):
        avg_out = torch.mean(x, dim=1, keepdim=True)
        max_out, _ = torch.max(x, dim=1, keepdim=True)
        x = torch.cat([avg_out, max_out], dim=1)
        x = self.conv1(x)
        return self.sigmoid(x)

class ChannelAttention(nn.Module):

    def __init__(self, in_planes, ratio=4):
        super(ChannelAttention, self).__init__()
        self.avg_pool = nn.AdaptiveAvgPool2d(1)
        self.max_pool = nn.AdaptiveMaxPool2d(1)
        self.fc1 = nn.Conv2d(in_planes, in_planes // ratio, 1, bias=False)
        self.relu1 = nn.ReLU()
        self.fc2 = nn.Conv2d(in_planes // ratio, in_planes, 1, bias=False)
        # self.sigmoid = nn.Sigmoid()
        self.sigmoid = HardSigmoid(alpha=1.0)

    def forward(self, x):
        avg_out = self.fc2(self.relu1(self.fc1(self.avg_pool(x))))
        max_out = self.fc2(self.relu1(self.fc1(self.max_pool(x))))
        out = avg_out + max_out
        return self.sigmoid(out)

class cbam_block(nn.Module):

    def __init__(self, channel, ratio=4, kernel_size=3):
        super(cbam_block, self).__init__()
        self.channelattention = ChannelAttention(channel, ratio=ratio)
        self.spatialattention = SpatialAttention(kernel_size=kernel_size)

    def forward(self, x):
        x = x * self.channelattention(x)
        x = x * self.spatialattention(x)
        return x

def channel_shuffle(x, groups):

    # input shape: [batch_size, channels, H, W]
    batch, channels, height, width = x.size()
    channels_per_group = channels // groups
    x = x.view(batch, groups, channels_per_group, height, width)
    x = torch.transpose(x, 1, 2).contiguous()
    x = x.view(batch, channels, height, width)
    return x

class ChannelShuffle(nn.Module):

    def __init__(self, channels, groups):
        super(ChannelShuffle, self).__init__()
        if channels % groups != 0:
            raise ValueError("The number of channels must be divisible by the number of groups.")
        self.groups = groups

    def forward(self, x):
        return channel_shuffle(x, self.groups)

def Computing_mean(x, mask):

    mask = torch.count_nonzero(mask, dim=2)
    mask = torch.unsqueeze(mask, dim=2)
    x = x.sum(dim=2, keepdim=True)
    x = x / mask
    return x

class CNN(nn.Module):

    def __init__(self, F1: int, classes_num: int, D: int = 2):

        super(CNN, self).__init__()
        self.drop_out = 0.25

        self.att = cbam_block(D * F1)
        self.block_1 = nn.Sequential(
            nn.ZeroPad2d((7, 7, 0, 0)),
            nn.Conv2d(
                in_channels=1,
                out_channels=F1,
                kernel_size=(1, 16),
                stride=(1, 2),
                bias=False
            ),
            nn.BatchNorm2d(F1),
            nn.ReLU(inplace=True),
            nn.AvgPool2d((1, 8))
        )
        self.block_2 = nn.Sequential(
            nn.ZeroPad2d((7, 7, 0, 0)),
            nn.Conv2d(
                in_channels=F1,
                out_channels=F1,
                kernel_size=(1, 16),
                stride=(1, 2),
                bias=False,
                groups=F1
            ),
            nn.Conv2d(
                in_channels=F1,
                out_channels=D * F1,
                kernel_size=(1, 1),
                stride=(1, 1),
                bias=False
            ),
            nn.BatchNorm2d(D * F1),
            nn.ReLU(inplace=True)
        )
        self.block_3 = nn.Sequential(
            nn.Conv2d(
                in_channels=D * F1,
                out_channels=D * F1,
                kernel_size=(3, 1),
                stride=(1, 1),
                groups=D * F1,
                bias=False
            ),
            nn.Conv2d(
                in_channels=D * F1,
                out_channels=D * D * F1,
                kernel_size=(1, 1),
                stride=(1, 1),
                groups=4,
                bias=False
            ),
            nn.BatchNorm2d(D * D * F1),
            nn.ReLU(inplace=True),
            ChannelShuffle(D * D * F1, 4),
        )
        self.block_4 = nn.Sequential(
            nn.ZeroPad2d((4, 3, 0, 0)),
            nn.Conv2d(
                in_channels=D * D * F1,
                out_channels=D * D * F1,
                kernel_size=(1, 8),
                stride=(1, 1),
                groups=D * D * F1,
                bias=False
            ),
            nn.BatchNorm2d(D * D * F1),
            nn.Conv2d(
                in_channels=D * D * F1,
                out_channels=D * D * D * F1,
                kernel_size=(1, 1),
                stride=(1, 1),
                groups=4,
                bias=False
            ),
            nn.BatchNorm2d(D * D * D * F1),
            nn.ReLU(inplace=True),
            nn.AvgPool2d((1, 16))
        )

        self.classifier = nn.Sequential(
            nn.Dropout(self.drop_out),
            nn.LazyLinear(classes_num)
        )

    def forward(self, x, ssp = None):

        x = x.unsqueeze(1) # (Batch, 1, 128, 512)

        mask = torch.abs(x).sum(dim=3, keepdim=True)
        mask = (mask > 0).type(torch.float)

        x = self.block_1(x)
        x = self.block_2(x)

        x = x * mask
        x1 = Computing_mean(x, mask)
        x2 = torch.norm(x, p=2, dim=2, keepdim=True)
        x3 = torch.norm(x, p=np.inf, dim=2, keepdim=True)

        x = torch.cat([x1, x2, x3], 2)
        x = self.att(x)
        x = self.block_3(x)
        x = self.block_4(x)
        x = x.view(x.shape[0], -1)

        x = self.classifier(x)

        return x
    


fs= 256                  #sampling frequency
channel= 128             #number of electrode
num_input= 1             #number of channel picture (for EEG signal is always : 1)
num_class= 2             #number of classes 
signal_length = 512      #number of sample in each tarial


kernel_size_1= (1,round(fs/2)) 
kernel_size_2= (channel, 1)
kernel_size_3= (1, round(fs/8))
kernel_size_4= (1, 1)

kernel_avgpool_1= (1,4)
kernel_avgpool_2= (1,8)
dropout_rate= 0.2

ks0= int(round((kernel_size_1[0]-1)/2))
ks1= int(round((kernel_size_1[1]-1)/2))
kernel_padding_1= (ks0, ks1-1)
ks0= int(round((kernel_size_3[0]-1)/2))
ks1= int(round((kernel_size_3[1]-1)/2))
kernel_padding_3= (ks0, ks1)


class EEGNet(nn.Module): 
    def __init__(self, F1, D):
        super().__init__()
        F2 = D*F1
        # layer 1
        self.conv2d = nn.Conv2d(num_input, F1, kernel_size_1, padding=kernel_padding_1)
        self.Batch_normalization_1 = nn.BatchNorm2d(F1)
        # layer 2
        self.Depthwise_conv2D = nn.Conv2d(F1, D*F1, kernel_size_2, groups= F1)
        self.Batch_normalization_2 = nn.BatchNorm2d(D*F1)
        self.Elu = nn.ELU()
        self.Average_pooling2D_1 = nn.AvgPool2d(kernel_avgpool_1)
        self.Dropout = nn.Dropout2d(dropout_rate)
        # layer 3
        self.Separable_conv2D_depth = nn.Conv2d( D*F1, D*F1, kernel_size_3,
                                                padding=kernel_padding_3, groups= D*F1)
        self.Separable_conv2D_point = nn.Conv2d(D*F1, F2, kernel_size_4)
        self.Batch_normalization_3 = nn.BatchNorm2d(F2)
        self.Average_pooling2D_2 = nn.AvgPool2d(kernel_avgpool_2)
        # layer 4
        self.Flatten = nn.Flatten()
        self.Dense = nn.Linear(F2*round(signal_length/32), num_class)
        self.Softmax = nn.Softmax(dim= 1)
        
        
    def forward(self, x):

        x = x.unsqueeze(1) # (Batch, 1, 128, 512)

        y = self.Batch_normalization_1(self.conv2d(x)) 
        y = self.Batch_normalization_2(self.Depthwise_conv2D(y))
        y = self.Elu(y)
        y = self.Dropout(self.Average_pooling2D_1(y))
        y = self.Separable_conv2D_depth(y)
        y = self.Batch_normalization_3(self.Separable_conv2D_point(y))
        y = self.Elu(y)
        y = self.Dropout(self.Average_pooling2D_2(y))
        y = self.Flatten(y)
        y = self.Dense(y)
        y = self.Softmax(y)
        
        return y
    



class GradientReversalFunction(torch.autograd.Function):

    @staticmethod
    def forward(ctx, x, lambda_):
        ctx.lambda_ = float(lambda_)

        return x.view_as(x)
    
    @staticmethod
    def backward(ctx, grad_output):
        return grad_output.neg() * ctx.lambda_, None
    

class GradientReversal(nn.Module):

    def __init__(self, lambda_: float = 1.0):
        super().__init__()
        self.lambda_ = float(lambda_)


    def forward(self, x):
        return GradientReversalFunction.apply(x, self.lambda_)


class BiLSTMWithAttention(nn.Module):
    def __init__(self, input_dim, lstm_hidden, attn_size, num_layers = 3, dropout = 0.0):
        super().__init__()
        self.lstm = nn.LSTM(
            input_size = input_dim, 
            hidden_size=lstm_hidden, 
            num_layers=num_layers,
            batch_first=True,
            dropout=dropout if num_layers > 1 else 0.0, 
            bidirectional=True
        )

        self.Ww = nn.Linear(lstm_hidden * 2, attn_size)
        self.u_w = nn.Parameter(torch.randn(attn_size))
        self.att_input_dim = lstm_hidden * 2

    def forward(self, x):
        H, _ = self.lstm(x)
        u_t = torch.tanh(self.Ww(H))
        scores = torch.einsum('btd, d ->bt', u_t, self.u_w)
        att = F.softmax(scores, dim = 1)
        v = torch.sum(att.unsqueeze(-1) * H, dim = 1)

        return v, att

class ConvBlock(nn.Module):
    def __init__(self, in_channels, out_channels, kernel_size, stride, pool_size=None, dropout=0.5):
        super(ConvBlock, self).__init__()
        layers = [
            nn.Conv1d(in_channels, out_channels, kernel_size=kernel_size, stride=stride),
            nn.GELU()
        ]
        if pool_size:
            layers.append(nn.MaxPool1d(kernel_size=pool_size[0], stride=pool_size[1]))
        if dropout:
            layers.append(nn.Dropout(dropout))
        self.block = nn.Sequential(*layers)

    def forward(self, x):
        return self.block(x)
    

class AL(nn.Module):
    def __init__(self, channel, reduction = 5):
        super(AL, self).__init__()
        self.avg_pool = nn.AdaptiveAvgPool1d(1)
        self.fc = nn.Sequential(
            nn.Linear(channel, channel // reduction), 
            nn.ReLU(), 
            nn.Linear(channel // reduction, channel), 
            nn.Sigmoid()
        )

    def forward(self ,x):

        y = self.avg_pool(x)
        y = y.squeeze(-1)
        y = self.fc(y)
        y = y.unsqueeze(-1)
        return x


class SEEGNet(nn.Module):
    def __init__(self, in_channels, class_count, reduction = 10, num_layers = 1):
        super(SEEGNet, self).__init__()
        self.in_channels = in_channels
        self.reduction = reduction

        self.branch1 = nn.Sequential(
            ConvBlock(self.in_channels, 64, kernel_size=1250 // 10, stride=100 // 10, pool_size=(4, 2)),
            ConvBlock(64, 128, kernel_size=7, stride=1, dropout=None),
            ConvBlock(128, 128, kernel_size=7, stride=1, pool_size = (2,2), dropout=None)
        )

        self.branch2 = nn.Sequential(
            ConvBlock(self.in_channels, 64, kernel_size=400 // 10, stride=50 // 10, pool_size=(4, 2)),
            ConvBlock(64, 128, kernel_size=7, stride=1, dropout = None),
            ConvBlock(128, 128, kernel_size=7, stride=1, pool_size=(2, 2), dropout=None)
        )

        self.branch3 = nn.Sequential(
            ConvBlock(self.in_channels, 64, kernel_size=50 // 2, stride=6 // 2, pool_size=(8, 2)),
            ConvBlock(64, 128, kernel_size=8, stride=1, dropout=None),
            ConvBlock(128, 128, kernel_size=8, stride=1, pool_size=(4, 4), dropout=None)
        )

        self.dp = nn.Dropout(0.5)
        self.conv1 = nn.Conv1d(128, 30, kernel_size=1, stride=1)
        self.conv2 = nn.Conv1d(30, 30, kernel_size=1, stride=1)

        self.AL = AL(30, reduction=reduction)

        self.bilstm = BiLSTMWithAttention(36, 64, 32, num_layers=num_layers)
        self.head1 = nn.Sequential(
            nn.Linear(128, 64),
            nn.ReLU(),
            nn.Linear(64, 2)
        )

        self.head2 = nn.Sequential(
            nn.Linear(128, 64),
            # nn.BatchNorm1d(64),
            nn.ReLU(),
            GradientReversal(lambda_=1.0),
            nn.Linear(64, class_count)
        )

    def forward(self, x):


        # x shape (batch_size, in_channels, signal_length)
        x_1 = self.branch1(x)
        x_2 = self.branch2(x)
        x_3 = self.branch3(x)

        x_cat = torch.cat((x_1, x_2, x_3), dim=-1)
        m = self.dp(x_cat)
        
        m = F.relu(self.conv1(m))

        f = self.conv2(m)

        e = self.AL(f)

        x_out = m + f * e

        lstm_hidden, _ = self.bilstm(x_out)

        seizure_logits = self.head1(lstm_hidden)
        domain_logits = self.head2(lstm_hidden)

        return seizure_logits