# 实现计划：QAT 量化 + 级联架构

> **状态**: 待数据分析后确定简单模型设计
> **最后更新**: 2026-02-05

## 目标概述
1. **QAT (Quantization Aware Training)** - 混合精度量化，部署到 FPGA
2. **级联结构** - 简单单通道模型优先判断，不确定的送入复杂模型
3. **可学习通道选择** - 训练时自动学习哪个通道最重要

---

## 用户选择的配置

| 配置项 | 选择 |
|--------|------|
| 目标硬件 | FPGA/专用芯片 |
| 量化位宽 | 混合精度 (关键层INT16, 其他INT8) |
| 级联策略 | 级联结构 (Cascade) |
| 不确定性判断 | 两类概率差值小 |
| 通道选择 | 训练时学习通道权重 |
| 单通道定义 | 只用 1 个电极通道 |

---

## 架构设计

```
输入 (B, 128, 512)
      ↓
┌─────────────────────────────┐
│  ChannelSelector            │  ← 学习通道权重，输出加权单通道
│  (可学习权重 + 内容感知)      │
└──────────────┬──────────────┘
               ↓
┌─────────────────────────────┐
│  SimpleSingleChannelModel   │  ← 待定设计，需数据分析
│  (轻量模型)                  │
└──────────────┬──────────────┘
               ↓
        置信度检查
      |p1 - p0| > τ ?
         ↙      ↘
    高置信度    低置信度
       ↓           ↓
    直接输出   ComplexModel (CNN)
                   ↓
                 输出
```

---

## Part 1: 混合精度 QAT 策略

### 量化位宽分配

| 层 | 位宽 | 原因 |
|----|------|------|
| `block_1` (首层Conv) | **INT16** | 保留输入信号保真度 |
| CBAM Attention | **INT16** | 注意力权重需要精度 |
| `classifier` (末层) | **INT16** | 分类边界精度 |
| Depthwise Conv (block_2/3/4) | **INT8** | 参数少，容忍量化 |
| BatchNorm | **INT8** | 推理时可融合 |

### FPGA 不支持的操作替换

| 原操作 | 替换为 |
|--------|--------|
| `torch.norm(p=inf)` | `torch.max(torch.abs(...))` |
| `torch.count_nonzero` | `(mask > 0).float().sum()` |
| `nn.LazyLinear` | 显式 `nn.Linear` |

---

## Part 2: 简单模型候选方案 (待数据分析后确定)

### 方案 A: 轻量 1D CNN
```python
Conv1d(1→16, k=15, s=2) → BN → ReLU → AvgPool(4)
Conv1d(16→32, k=7, s=2) → BN → ReLU → AvgPool(4)
Conv1d(32→64, k=3, s=1) → BN → ReLU → AdaptiveAvgPool(1)
Flatten → Dropout → Linear(64→2)
# 参数量: ~2,500
```

### 方案 B: FFT 频带能量 + MLP
```python
FFT → 提取 5 个频带能量 (delta, theta, alpha, beta, gamma)
MLP: 5→16→2
# 参数量: ~150, 但 FFT 在 FPGA 上复杂
```

### 方案 C: 简单统计特征
```python
variance + peak + zero_crossings → Linear(3→2)
# 参数量: ~10, 但表达力弱
```

---

## Part 3: 训练策略

### 推荐: 分阶段训练 (Staged)

| 阶段 | 训练内容 | Epochs |
|------|---------|--------|
| Stage 1 | ChannelSelector + SimpleModel | 10 |
| Stage 2 | ComplexModel (冻结简单模型) | 10 |
| Stage 3 | 联合微调所有组件 | 5 |

### 级联损失函数
```python
Loss = α₁ × L_simple      # 简单模型分类损失
     + α₂ × L_complex     # 复杂模型分类损失 (仅路由样本)
     + α₃ × L_routing     # 路由效率惩罚
     + α₄ × L_sparsity    # 通道稀疏正则化
```

---

## Part 4: 文件修改清单

### 新建文件
1. `qat_model.py` - QAT 模型定义
2. `cascade_models.py` - 级联架构组件
3. `cascade_training.py` - 级联训练器和损失
4. `main_swec_cascade.py` - 新的训练入口

### 修改文件
- `baselines.py` - 添加 FPGA 友好的操作替换（可选）
- `utils/evaluation.py` - 添加级联效率指标

---

## Part 5: 待办数据分析

在另一台电脑上需要分析：

1. **类别可分性**
   - 癫痫 vs 非癫痫样本在不同通道上的分布差异
   - 哪些通道的区分度最高

2. **样本难度分布**
   - 用现有 CNN 的置信度分布看"容易"样本占比
   - 确定级联是否有意义

3. **通道相关性**
   - 128 通道之间的相关性矩阵
   - 是否存在少数关键通道

4. **时频特征**
   - 癫痫发作的典型频率/时域模式
   - 决定简单模型应该捕捉什么

---

## 关键文件路径

- 现有 CNN 模型: `baselines.py` 第 311-425 行
- 训练脚本: `main_swec_exp.py`
- 数据集: `dataset_swec.py`
- 实验设置: `exp_settings.py`
- 数据路径: `/scratch/Arya/SWEC/`

---

## 下一步

1. 在另一台电脑打开此文件
2. 分析数据
3. 确定简单模型设计
4. 开始实现
