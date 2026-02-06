#!/bin/bash

#==============================================================================
# iEEG Data Analysis Quick Start Script
#==============================================================================

echo "=========================================="
echo "iEEG Data Analysis Script"
echo "=========================================="
echo ""

# Check environment
echo "[1/6] Checking environment..."
if [ -d "/scratch/Arya/SWEC/" ]; then
    echo "  ✓ Data directory exists: /scratch/Arya/SWEC/"
else
    echo "  ✗ Error: Data directory not found"
    exit 1
fi

# Create output directories
echo ""
echo "[2/6] Creating output directories..."
mkdir -p /scratch/hdeng/project2/analysis_results
mkdir -p /scratch/hdeng/project2/analysis_results/plots
mkdir -p /scratch/hdeng/project2/analysis_results/data
mkdir -p /scratch/hdeng/project2/checkpoints
echo "  ✓ Output directories created"

# Activate conda environment
echo ""
echo "[3/7] Activating conda environment..."
echo "  Activating environment: REST_REAL2"
# Check if running in conda, if not try to activate
if ! conda env list | grep -q "REST_REAL2"; then
    echo "  ⚠ Warning: REST_REAL2 environment not found"
    echo "  Please manually activate: conda activate REST_REAL2"
else
    source $(conda info --base)/etc/profile.d/conda.sh
    conda activate REST_REAL2
    echo "  ✓ Environment activated: REST_REAL2"
fi

# Check Python environment
echo ""
echo "[4/7] Checking Python environment..."
python --version
echo "  Checking dependencies..."
python -c "import torch; print('  ✓ PyTorch:', torch.__version__)"
python -c "import numpy; print('  ✓ NumPy:', numpy.__version__)"
python -c "import pandas; print('  ✓ Pandas:', pandas.__version__)"
python -c "import matplotlib; print('  ✓ Matplotlib:', matplotlib.__version__)"
python -c "import scipy; print('  ✓ SciPy:', scipy.__version__)"
python -c "import sklearn; print('  ✓ Scikit-learn:', sklearn.__version__)"

# Set parameters
echo ""
echo "[5/7] Configuring parameters..."
EXP_ID=${1:-3}  # Default experiment ID = 3
TRAIN_REF=${2:-1}  # Default: train reference model

echo "  Experiment ID: $EXP_ID"
echo "  Train reference model: $TRAIN_REF (1=yes, 0=no)"

# Run analysis
echo ""
echo "[6/7] Running analysis script..."
echo "  This may take 40-70 minutes..."
echo "  Start time: $(date '+%Y-%m-%d %H:%M:%S')"
echo ""

python analyze_data.py \
    --exp_id $EXP_ID \
    --train_reference $TRAIN_REF \
    --data_path /scratch/Arya/SWEC/ \
    --output_dir /scratch/hdeng/project2/analysis_results/ \
    --checkpoint_dir /scratch/hdeng/project2/checkpoints/ \
    --num_epochs 10 \
    --batch_size 32 \
    --seed 42

RESULT=$?

# Check results
echo ""
echo "[7/7] Checking output..."
if [ $RESULT -eq 0 ]; then
    echo "  ✓ Analysis completed successfully!"
    echo ""
    echo "Output files:"
    echo "  - HTML report: /scratch/hdeng/project2/analysis_results/report.html"
    echo "  - Plots directory: /scratch/hdeng/project2/analysis_results/plots/"
    echo "  - Data directory: /scratch/hdeng/project2/analysis_results/data/"
    echo ""
    echo "View results:"
    echo "  1. On server: firefox /scratch/hdeng/project2/analysis_results/report.html"
    echo "  2. Or sync to local: scp -r hdeng@inlsrv3:/scratch/hdeng/project2/analysis_results/ ./local_results/"
    echo ""
    echo "End time: $(date '+%Y-%m-%d %H:%M:%S')"
else
    echo "  ✗ Analysis failed with exit code: $RESULT"
    echo "  Please check the error messages above"
    exit 1
fi

echo ""
echo "=========================================="
echo "Analysis Complete!"
echo "=========================================="
