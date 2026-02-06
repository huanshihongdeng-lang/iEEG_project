# Quick Start: Running Analysis on Remote Server

## Step 1: Connect to Remote Server

### Windows Users (PowerShell or CMD)

```powershell
ssh hdeng@inlsrv3
# Enter password: qweasdzxcv155@
```

### Or Use SSH Config File

Add to `~/.ssh/config`:

```
Host inlsrv3
    HostName inlsrv3
    User hdeng
    Port 22
```

Then you can directly:
```bash
ssh inlsrv3
```

---

## Step 2: Navigate to Project Directory

```bash
cd /home/hdeng/ic/iEEG_Transformer_Project2/Model/DMnet/
pwd  # Confirm current directory
```

---

## Step 3: Activate Conda Environment

```bash
conda activate REST_REAL2
```

---

## Step 4: Confirm Files Exist

```bash
# Check analysis scripts
ls -lh analyze_data.py
ls -lh run_analysis.sh

# Check data directory
ls /scratch/Arya/SWEC/ | head -5
```

You should see output similar to:
```
ID03
ID04
ID05
ID06
ID07
```

---

## Step 5: Run Analysis

### Option 1: Using Startup Script (Recommended)

```bash
# Add execution permission to script
chmod +x run_analysis.sh

# Run (using default parameters: exp_id=3, train_reference=1)
./run_analysis.sh

# Or specify parameters
./run_analysis.sh 5 1  # exp_id=5, train reference model
```

### Option 2: Run Python Script Directly

```bash
python analyze_data.py --exp_id 3 --train_reference 1
```

### Option 3: Run in Background Using Screen (Recommended for Long Jobs)

```bash
# Create new screen session
screen -S ieeg_analysis

# Activate conda environment in screen
conda activate REST_REAL2

# Run in screen
./run_analysis.sh

# Detach screen session (let it run in background)
# Press: Ctrl+A, then press D

# Reconnect after SSH disconnect
ssh hdeng@inlsrv3
screen -r ieeg_analysis  # Reconnect to session
```

---

## Step 6: Monitor Progress

### View Real-time Output

If running in screen:
```bash
screen -r ieeg_analysis
```

If using nohup:
```bash
tail -f analysis.log
```

### Check Output Directory

```bash
# View generated files
ls -lh /scratch/hdeng/project2/analysis_results/
ls -lh /scratch/hdeng/project2/analysis_results/plots/
ls -lh /scratch/hdeng/project2/analysis_results/data/
```

---

## Step 7: View Results

### View HTML Report on Server

```bash
firefox /scratch/hdeng/project2/analysis_results/report.html &
```

### Sync to Local Machine (Recommended)

**Run on local Windows machine**:

```powershell
# Download using SCP
scp -r hdeng@inlsrv3:/scratch/hdeng/project2/analysis_results/ "C:\Users\95471\INL Dropbox\deng huanshihong\NAS\project2\analysis_results\"

# Or download only HTML report
scp hdeng@inlsrv3:/scratch/hdeng/project2/analysis_results/report.html "C:\Users\95471\INL Dropbox\deng huanshihong\NAS\project2\"
```

Then open `report.html` in local browser

---

## Common Screen Commands

| Command | Description |
|---------|-------------|
| `screen -S name` | Create session named 'name' |
| `Ctrl+A, D` | Detach current session |
| `screen -ls` | List all sessions |
| `screen -r name` | Reconnect to session |
| `screen -X -S name quit` | Terminate session |
| `Ctrl+C` | Stop current program in session |
| `exit` | Exit screen session |

---

## Expected Output

During execution you will see output similar to:

```
======================================================================
 iEEG Data Analysis - Sensitivity/Specificity Core Metrics
======================================================================
Environment: remote
Data path: /scratch/Arya/SWEC/
Output dir: /scratch/hdeng/project2/analysis_results/
Medical sensitivity threshold: 0.85
Device: CUDA
======================================================================

[Loading Dataset]
  Experiment ID: 3
  Training patients: [5, 6, 7, 8, 9, 10, 12, 13, 14, 16, 18]
  Validation patients: [4]
  Test patients: [3]
  Class ratio (pos/neg): 0.234

[Training Reference CNN Model]
  Epoch 1/10 | Loss: 0.5234 | Val F1: 0.7123 | Val Sens: 0.8234
  Epoch 2/10 | Loss: 0.4123 | Val F1: 0.7456 | Val Sens: 0.8456
  ...

[Evaluating Baseline CNN Performance]
  Accuracy: 0.8567
  Sensitivity: 0.8823
  Specificity: 0.8234
  F1 Score: 0.8123

======================================================================
 Confidence and Cascade Feasibility Analysis (Sensitivity/Specificity)
======================================================================

[Confidence Analysis Module]
  Extracting confidence distribution...
  Calibrating cascade threshold...
  Stratifying sample difficulty...
  Plotting confidence distribution...
  Plotting Sensitivity/Specificity analysis suite...
  Plotting sample difficulty pie chart...

[Confidence Analysis Results]
  - Easy sample ratio: 73.2%
  - Optimal threshold: 0.65
  - Sensitivity at threshold: 0.884
  - Specificity at threshold: 0.812
  - Meets medical requirements: ✓

======================================================================
 Time-Frequency Feature Analysis
======================================================================

[Frequency Analysis Module]
  Computing frequency band energy...
  Plotting band discriminability...

[Frequency Analysis Results]
  - Most discriminative band: gamma
  - Maximum t-statistic: 6.34

======================================================================
 Model Recommendation
======================================================================

Recommended approach: Option B: FFT + MLP - gamma band shows strong discriminability

======================================================================
 Generating Analysis Report
======================================================================

[Generating HTML Report]
  HTML report generated: /scratch/hdeng/project2/analysis_results/report.html

======================================================================
 Analysis Complete!
======================================================================

Output directory: /scratch/hdeng/project2/analysis_results/
  - HTML report: report.html
  - Charts: plots/
  - Data: data/

Sync results to local:
  scp -r hdeng@inlsrv3:/scratch/hdeng/project2/analysis_results/ ./local_results/

======================================================================
```

---

## Troubleshooting

### Issue 1: Connection Timeout

```bash
# Check network connection
ping inlsrv3

# Try using full domain name
ssh hdeng@inlsrv3.full.domain.name
```

### Issue 2: Permission Denied

```bash
# Check output directory permissions
ls -ld /scratch/hdeng/project2/

# Create directory if needed
mkdir -p /scratch/hdeng/project2/analysis_results
```

### Issue 3: Python Packages Missing

```bash
# Activate conda environment first
conda activate REST_REAL2

# Install missing packages
pip install torch numpy pandas matplotlib scipy scikit-learn

# Or use conda
conda install pytorch numpy pandas matplotlib scipy scikit-learn -c pytorch
```

### Issue 4: CUDA Unavailable

Script will automatically fallback to CPU, but if you want to use GPU:

```bash
# Check GPU
nvidia-smi

# Set visible GPU
export CUDA_VISIBLE_DEVICES=0
python analyze_data.py --exp_id 3
```

### Issue 5: Data Path Error

```bash
# Confirm data location
ls /scratch/Arya/SWEC/ID03/
# Should see: X_train.npy y_train.npy X_total.npy Y_total.npy

# If data is in different location, use --data_path argument
python analyze_data.py --exp_id 3 --data_path /your/data/path/
```

### Issue 6: Conda Environment Not Found

```bash
# List available conda environments
conda env list

# If REST_REAL2 doesn't exist, create it
conda create -n REST_REAL2 python=3.8
conda activate REST_REAL2
pip install torch numpy pandas matplotlib scipy scikit-learn
```

---

## Next Steps

After analysis completes:

1. **View HTML Report** - Contains complete analysis results and visualizations
2. **Check Optimal Threshold** - In `data/optimal_threshold.json`
3. **Implement Simple Model Based on Recommendation** - Report will provide specific suggestions
4. **Analyze Other Experiment IDs if Needed** - Repeat with different `--exp_id`

---

## Complete Command Checklist

```bash
# 1. SSH login
ssh hdeng@inlsrv3

# 2. Navigate to project directory
cd /home/hdeng/ic/iEEG_Transformer_Project2/Model/DMnet/

# 3. Activate conda environment
conda activate REST_REAL2

# 4. Run using screen
screen -S ieeg_analysis
chmod +x run_analysis.sh
./run_analysis.sh 3 1

# 5. Detach screen (Ctrl+A, D)

# 6. Exit SSH
exit

# 7. Reconnect later to check
ssh hdeng@inlsrv3
screen -r ieeg_analysis

# 8. After analysis completes, download results locally
# (Run on local Windows PowerShell)
scp -r hdeng@inlsrv3:/scratch/hdeng/project2/analysis_results/ "C:\Users\95471\INL Dropbox\deng huanshihong\NAS\project2\analysis_results\"
```

---

Great! Now you can start running the analysis. Good luck! 🎉
