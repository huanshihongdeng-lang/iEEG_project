# iEEG Data Analysis Script User Guide

## Overview

`analyze_data.py` is a comprehensive data analysis script for analyzing the SWEC dataset and providing evidence for cascade architecture design.

**Core Features**:
- ✅ Confidence analysis based on Sensitivity/Specificity (test set)
- ✅ Sample difficulty stratification (easy/medium/hard) (test set)
- ✅ Cascade threshold calibration (test set)
- ✅ Frequency feature discriminability analysis (test set)
- ✅ **Channel importance analysis** - **Uses all patients** for robust selection
- ✅ **Time-domain feature analysis** - **Uses all patients** for robust selection
- ✅ HTML visualization report generation

**Medical Standard**: Sensitivity ≥ 0.85 (to avoid missing seizure detections)

**Data Scope**:
- CNN performance metrics and cascade analysis use **test set only** (evaluating trained model)
- Channel importance and time-domain features use **all patients** (train + valid + test) to ensure the selected channels and features generalize across different patients

---

## Quick Start

### Method 1: Run on Remote Server (Recommended)

```bash
# 1. SSH login to remote server
ssh hdeng@inlsrv3
# Password: qweasdzxcv155@

# 2. Navigate to project directory
cd /home/hdeng/ic/iEEG_Transformer_Project2/Model/DMnet/

# 3. Activate conda environment
conda activate REST_REAL2

# 4. Ensure data path exists
ls /scratch/Arya/SWEC/  # Should see ID03, ID04, ... ID18

# 5. Create output directories
mkdir -p /scratch/hdeng/project2/analysis_results
mkdir -p /scratch/hdeng/project2/checkpoints

# 6. Use screen to run (prevents disconnection)
screen -S ieeg_analysis

# 7. Run analysis
python analyze_data.py --exp_id 3 --train_reference 1

# 8. Detach screen session
# Press: Ctrl+A, then press D

# 9. Reconnect to check progress
screen -r ieeg_analysis
```

### Method 2: Using Existing Checkpoint

If you already have a trained CNN model:

```bash
python analyze_data.py \
    --exp_id 3 \
    --checkpoint_path /scratch/hdeng/project2/checkpoints/cnn_exp3_reference.pth \
    --train_reference 0
```

---

## Command Line Arguments

| Parameter | Default | Description |
|-----------|---------|-------------|
| `--exp_id` | 3 | Experiment ID (1-13) |
| `--train_reference` | 1 | Whether to train reference CNN (1=yes, 0=no) |
| `--checkpoint_path` | None | Path to existing checkpoint |
| `--data_path` | /scratch/Arya/SWEC/ | Data path (auto-detected) |
| `--output_dir` | /scratch/hdeng/project2/analysis_results/ | Output directory |
| `--checkpoint_dir` | /scratch/hdeng/project2/checkpoints/ | Checkpoint directory |
| `--F1` | 16 | Number of first layer CNN filters |
| `--D` | 2 | CNN channel expansion factor |
| `--num_epochs` | 10 | Training epochs |
| `--batch_size` | 32 | Training batch size |
| `--seed` | 42 | Random seed |

---

## Output Results

### Directory Structure

```
/scratch/hdeng/project2/analysis_results/
├── report.html              # HTML visualization report (main output)
├── plots/                   # All charts
│   ├── confidence_distribution.png
│   ├── sensitivity_analysis_suite.png
│   ├── sample_difficulty_pie.png
│   ├── frequency_bands.png
│   ├── channel_importance.png       # NEW: Channel importance analysis
│   ├── channel_correlation.png      # NEW: Channel correlation matrix
│   └── time_domain_features.png     # NEW: Time-domain features
├── data/                    # Data files
│   ├── confidence_distribution.npy
│   ├── threshold_calibration.csv
│   ├── optimal_threshold.json
│   ├── frequency_band_stats.json
│   ├── channel_importance.csv       # NEW: Channel importance scores
│   ├── top_channels.json           # NEW: Top K channels
│   ├── channel_correlation_matrix.npy  # NEW: Correlation matrix
│   └── time_domain_features.json   # NEW: Time-domain feature stats
└── checkpoints/             # Trained models
    └── cnn_exp3_reference.pth
```

### Main Outputs

1. **`report.html`** - Complete analysis report containing:
   - Current CNN model's Sensitivity/Specificity
   - Cascade feasibility analysis
   - Sample difficulty distribution
   - Frequency feature discriminability
   - **Channel importance ranking** (NEW)
   - **Time-domain feature discriminability** (NEW)
   - Simple model design recommendations

2. **`optimal_threshold.json`** - Recommended cascade threshold:
   ```json
   {
     "optimal_threshold": 0.65,
     "sensitivity": 0.88,
     "specificity": 0.82,
     "coverage": 0.73,
     "meets_medical_requirements": true
   }
   ```

3. **Visualization Charts**:
   - Sensitivity & Specificity vs Threshold curves
   - Coverage-Sensitivity trade-off
   - Sample difficulty pie chart
   - Frequency band discriminability bar chart

---

## Sync Results to Local Machine

### Using SCP

Execute in **local Windows machine** PowerShell:

```powershell
# Download complete results directory
scp -r hdeng@inlsrv3:/scratch/hdeng/project2/analysis_results/ "C:\Users\95471\INL Dropbox\deng huanshihong\NAS\project2\analysis_results\"
```

### Using WinSCP (GUI)

1. Open WinSCP
2. Host name: `inlsrv3`
3. User name: `hdeng`
4. Password: `qweasdzxcv155@`
5. Connect and download `/scratch/hdeng/project2/analysis_results/`

---

## Estimated Runtime

| Step | Time |
|------|------|
| Data loading | ~1 minute |
| Train reference CNN | ~30-60 minutes (10 epochs) |
| Confidence analysis | ~5 minutes |
| Frequency analysis | ~2 minutes |
| Channel importance analysis | ~3 minutes |
| Time-domain feature analysis | ~2 minutes |
| Generate report | ~1 minute |
| **Total** | **~45-75 minutes** |

If using existing checkpoint, skip training step, total time is approximately **15 minutes**.

---

## FAQ

### Q1: How to check running progress?

```bash
# Reconnect to screen session
screen -r ieeg_analysis

# Or check output
tail -f /scratch/hdeng/project2/analysis_results/run.log  # if output was redirected
```

### Q2: How to stop running?

```bash
# Connect to screen session
screen -r ieeg_analysis

# Press Ctrl+C to stop
# Then press Ctrl+D or type exit to quit screen
```

### Q3: How to run in background?

```bash
# Using nohup
nohup python analyze_data.py --exp_id 3 > analysis.log 2>&1 &

# Check progress
tail -f analysis.log
```

### Q4: Data path not found?

Ensure data is in correct location:
```bash
ls /scratch/Arya/SWEC/
# Should see: ID03/ ID04/ ID05/ ... ID18/

ls /scratch/Arya/SWEC/ID03/
# Should see: X_train.npy y_train.npy X_total.npy Y_total.npy
```

### Q5: GPU unavailable?

Script will automatically detect and use CPU. If you want to use GPU:
```bash
# Check GPU
nvidia-smi

# Set visible GPU
export CUDA_VISIBLE_DEVICES=0
python analyze_data.py --exp_id 3
```

---

## Interpreting Analysis Results

### Sensitivity/Specificity

- **Sensitivity**: TP/(TP+FN) - Ability to correctly identify seizures
  - Medical standard: ≥ 0.85 (avoid missing detections)
  - High Sensitivity = Won't miss seizure events

- **Specificity**: TN/(TN+FP) - Ability to correctly identify normal states
  - Recommended: ≥ 0.80
  - High Specificity = Won't raise false alarms

### Cascade Feasibility

- **Easy sample ratio > 60%**: ✓ Cascade recommended
- **Easy sample ratio < 60%**: ✗ Cascade benefits unclear

### Frequency Features

- **t-statistic > 5**: Highly discriminative band → Recommend FFT+MLP
- **t-statistic < 5**: Recommend time-domain CNN

### Channel Importance

- **Top K channels**: Most discriminative channels for seizure detection
- **Use case**: Guide ChannelSelector design to focus on important channels
- **80% rule**: Typically 20-40 channels capture 80% of discriminative information

### Time-Domain Features

- **Most discriminative feature**: Best simple statistical feature for lightweight model
- **Use case**: Can be used as input features for simple MLP-based classifier
- **Feature ranking**: Helps select minimal feature set for simple model

---

## Next Steps

After analysis completes, follow report recommendations:

1. **If cascade is recommended**:
   - Implement recommended simple model (Option A or B)
   - Use threshold from `optimal_threshold.json` to configure routing

2. **If cascade is not recommended**:
   - Continue with single CNN model
   - Consider other optimization directions (quantization, pruning, etc.)

3. **View complete report**:
   ```bash
   # Open in browser on server (if X forwarding available)
   firefox /scratch/hdeng/project2/analysis_results/report.html

   # Or download to local machine for viewing
   ```

---

## Contact and Support

If you encounter issues, please check:
1. Data path is correct
2. Dependencies installed (torch, numpy, pandas, matplotlib, scipy, sklearn)
3. Output directory has write permissions
4. Conda environment is activated: `conda activate REST_REAL2`

Related files:
- Plan document: `C:\Users\95471\.claude\plans\valiant-humming-sphinx.md`
- Main script: `Model/DMnet/analyze_data.py`
- Original architecture plan: `Model/DMnet/PLAN_cascade_qat.md`
