"""
iEEG Data Analysis Script - Sensitivity/Specificity Focus
=========================================================

Analyze SWEC dataset to provide insights for cascade architecture design.

Primary evaluation metrics: Sensitivity and Specificity
Execution environment: Remote server hdeng@inlsrv3
"""

import argparse
import os
import sys
from pathlib import Path
import numpy as np
import pandas as pd
import torch
import torch.nn as nn
import torch.nn.functional as F
from datetime import datetime
import json
import matplotlib
matplotlib.use('Agg')  # 非交互式后端，适合远程运行
import matplotlib.pyplot as plt
from scipy.stats import ttest_ind
from scipy.signal import spectrogram
from sklearn.decomposition import PCA

# Add current directory to path
current_dir = Path(__file__).parent
if str(current_dir) not in sys.path:
    sys.path.insert(0, str(current_dir))

# Import existing modules
from baselines import CNN
from dataset_swec import IEEGDataset
from exp_settings import EXPSettings_SWEC
from utils.evaluation import Metrics


#============================================================================
# Environment Detection and Path Configuration
#============================================================================

def detect_environment():
    """Detect current running environment"""
    if Path('/scratch/Arya/SWEC/').exists():
        return 'remote'
    else:
        return 'local'


def get_default_paths(env):
    """Return default paths based on environment"""
    if env == 'remote':
        return {
            'data_path': '/scratch/Arya/SWEC/',
            'output_dir': '/scratch/hdeng/project2/analysis_results/',
            'checkpoint_dir': '/scratch/hdeng/project2/checkpoints/'
        }
    else:
        return {
            'data_path': 'C:/Users/95471/INL Dropbox/deng huanshihong/NAS/project2/local_data/',
            'output_dir': 'C:/Users/95471/INL Dropbox/deng huanshihong/NAS/project2/analysis_results/',
            'checkpoint_dir': 'C:/Users/95471/INL Dropbox/deng huanshihong/NAS/project2/checkpoints/'
        }


def init_seed(seed):
    """Initialize random seed"""
    torch.manual_seed(seed)
    torch.cuda.manual_seed_all(seed)
    np.random.seed(seed)


#============================================================================
# Confidence Analyzer (Core Module)
#============================================================================

class ConfidenceAnalyzer:
    """
    Question 2: Sample difficulty and cascade feasibility analysis
    Based on Sensitivity/Specificity metrics
    """

    def __init__(self, model, dataloader, output_dir):
        self.model = model
        self.dataloader = dataloader
        self.output_dir = Path(output_dir)
        self.plots_dir = self.output_dir / 'plots'
        self.data_dir = self.output_dir / 'data'

        self.plots_dir.mkdir(parents=True, exist_ok=True)
        self.data_dir.mkdir(parents=True, exist_ok=True)

    def extract_confidence_dist(self):
        """Extract confidence distribution"""
        print("  Extracting confidence distribution...")
        all_probs = []
        all_labels = []
        all_logits = []

        self.model.eval()
        device = next(self.model.parameters()).device

        with torch.no_grad():
            for x, y in self.dataloader:
                x = x.to(device)
                logits = self.model(x)  # (B, 2)
                probs = torch.softmax(logits, dim=1)
                all_probs.append(probs.cpu())
                all_labels.append(y)
                all_logits.append(logits.cpu())

        probs = torch.cat(all_probs).numpy()  # (N, 2)
        labels = torch.cat(all_labels).numpy()  # (N,)

        # Confidence margin: |p_1 - p_0|
        confidence_margin = np.abs(probs[:, 1] - probs[:, 0])

        result = {
            'probs': probs,
            'labels': labels,
            'confidence_margin': confidence_margin,
            'predictions': probs.argmax(1)
        }

        # Save data
        np.save(self.data_dir / 'confidence_distribution.npy', confidence_margin)

        return result

    def calibrate_threshold(self, confidence_data):
        """
        Threshold calibration - based on Sensitivity/Specificity Trade-off
        Goal: maximize simple model coverage while maintaining high sensitivity
        """
        print("  Calibrating cascade threshold...")
        margins = confidence_data['confidence_margin']
        labels = confidence_data['labels']
        preds = confidence_data['predictions']

        results = []
        for tau in np.arange(0.1, 1.0, 0.05):
            # High confidence samples (will be routed to simple model)
            high_conf_mask = margins > tau
            coverage = high_conf_mask.mean()

            if coverage > 0:
                # Calculate medical metrics
                y_true = labels[high_conf_mask]
                y_pred = preds[high_conf_mask]

                # Sensitivity: TP / (TP + FN)
                tp = ((y_pred == 1) & (y_true == 1)).sum()
                fn = ((y_pred == 0) & (y_true == 1)).sum()
                sensitivity = tp / (tp + fn) if (tp + fn) > 0 else 0

                # Specificity: TN / (TN + FP)
                tn = ((y_pred == 0) & (y_true == 0)).sum()
                fp = ((y_pred == 1) & (y_true == 0)).sum()
                specificity = tn / (tn + fp) if (tn + fp) > 0 else 0

                # F1 score
                prec = tp / (tp + fp) if (tp + fp) > 0 else 0
                rec = sensitivity
                f1 = 2 * prec * rec / (prec + rec) if (prec + rec) > 0 else 0

                acc = (y_pred == y_true).mean()
            else:
                sensitivity, specificity, acc, f1 = 0, 0, 0, 0

            results.append({
                'threshold': tau,
                'coverage': coverage,
                'sensitivity': sensitivity,
                'specificity': specificity,
                'accuracy': acc,
                'f1': f1,
                'n_samples': int(high_conf_mask.sum()),
                'meets_medical_req': bool(sensitivity >= 0.85)
            })

        df = pd.DataFrame(results)

        # Find optimal threshold that meets medical requirements
        valid_thresholds = df[df['meets_medical_req']]
        if len(valid_thresholds) > 0:
            optimal_idx = valid_thresholds['coverage'].argmax()
            optimal_tau = valid_thresholds.iloc[optimal_idx]['threshold']
        else:
            optimal_idx = df['sensitivity'].argmax()
            optimal_tau = df.iloc[optimal_idx]['threshold']

        # Save results
        df.to_csv(self.data_dir / 'threshold_calibration.csv', index=False)

        optimal_row = df[df['threshold'] == optimal_tau].iloc[0]
        optimal_config = {
            'optimal_threshold': float(optimal_tau),
            'sensitivity': float(optimal_row['sensitivity']),
            'specificity': float(optimal_row['specificity']),
            'coverage': float(optimal_row['coverage']),
            'meets_medical_requirements': bool(optimal_row['meets_medical_req'])
        }

        with open(self.data_dir / 'optimal_threshold.json', 'w') as f:
            json.dump(optimal_config, f, indent=2)

        return df, optimal_tau

    def stratify_difficulty(self, confidence_margin, threshold):
        """Stratify samples into three categories based on confidence margin"""
        print("  Stratifying sample difficulty...")
        easy = confidence_margin > 0.7
        medium = (confidence_margin > 0.3) & (confidence_margin <= 0.7)
        hard = confidence_margin <= 0.3

        return {
            'easy': easy,
            'medium': medium,
            'hard': hard,
            'proportions': {
                'easy': float(easy.mean()),
                'medium': float(medium.mean()),
                'hard': float(hard.mean())
            },
            'recommended_cascade': bool(easy.mean() > 0.6)
        }

    def plot_confidence_distribution(self, confidence_data):
        """Plot confidence distribution"""
        print("  Plotting confidence distribution...")
        fig, axes = plt.subplots(1, 2, figsize=(14, 5))

        probs = confidence_data['probs']
        labels = confidence_data['labels']
        margin = confidence_data['confidence_margin']

        # Left plot: confidence distribution by class
        ax = axes[0]
        ax.hist(margin[labels==0], bins=50, alpha=0.6, label='Non-seizure', color='blue')
        ax.hist(margin[labels==1], bins=50, alpha=0.6, label='Seizure', color='red')
        ax.set_xlabel('Confidence Margin |p1 - p0|', fontsize=12)
        ax.set_ylabel('Frequency', fontsize=12)
        ax.set_title('Confidence Distribution', fontsize=14, fontweight='bold')
        ax.legend()
        ax.grid(True, alpha=0.3)

        # Right plot: confidence by prediction correctness
        ax = axes[1]
        correct = (confidence_data['predictions'] == labels)
        ax.hist(margin[correct], bins=50, alpha=0.6, label='Correct', color='green')
        ax.hist(margin[~correct], bins=50, alpha=0.6, label='Incorrect', color='orange')
        ax.set_xlabel('Confidence Margin |p1 - p0|', fontsize=12)
        ax.set_ylabel('Frequency', fontsize=12)
        ax.set_title('Confidence by Prediction Correctness', fontsize=14, fontweight='bold')
        ax.legend()
        ax.grid(True, alpha=0.3)

        plt.tight_layout()
        plt.savefig(self.plots_dir / 'confidence_distribution.png', dpi=300, bbox_inches='tight')
        plt.close()

    def plot_sensitivity_analysis_suite(self, threshold_df, optimal_tau):
        """
        Generate core plots for confidence analysis
        Focus: Sensitivity/Specificity trade-off
        """
        print("  Plotting Sensitivity/Specificity analysis suite...")
        fig, axes = plt.subplots(2, 2, figsize=(14, 12))

        # (0,0): Sens & Spec vs Threshold
        ax = axes[0, 0]
        ax.plot(threshold_df['threshold'], threshold_df['sensitivity'],
                'b-', label='Sensitivity', linewidth=2)
        ax.plot(threshold_df['threshold'], threshold_df['specificity'],
                'r-', label='Specificity', linewidth=2)
        ax.axhline(0.85, color='g', linestyle='--', alpha=0.7, label='Medical Req (0.85)')
        ax.axvline(optimal_tau, color='orange', linestyle='--', label=f'Optimal τ={optimal_tau:.2f}')
        ax.set_xlabel('Confidence Threshold (τ)', fontsize=12)
        ax.set_ylabel('Score', fontsize=12)
        ax.set_title('Sensitivity & Specificity vs Threshold', fontsize=14, fontweight='bold')
        ax.legend(fontsize=10)
        ax.grid(True, alpha=0.3)

        # (0,1): Coverage vs Sensitivity
        ax = axes[0, 1]
        ax.plot(threshold_df['coverage'], threshold_df['sensitivity'],
                'b-o', linewidth=2, markersize=5)
        ax.axhline(0.85, color='g', linestyle='--', label='Min Sensitivity (0.85)')
        ax.set_xlabel('Simple Model Coverage', fontsize=12)
        ax.set_ylabel('Sensitivity', fontsize=12)
        ax.set_title('Coverage-Sensitivity Trade-off', fontsize=14, fontweight='bold')
        ax.legend()
        ax.grid(True, alpha=0.3)

        # (1,0): Sens-Spec scatter
        ax = axes[1, 0]
        scatter = ax.scatter(threshold_df['specificity'], threshold_df['sensitivity'],
                            c=threshold_df['coverage'], cmap='viridis', s=100)
        ax.set_xlabel('Specificity', fontsize=12)
        ax.set_ylabel('Sensitivity', fontsize=12)
        ax.set_title('Sensitivity vs Specificity (colored by coverage)', fontsize=14, fontweight='bold')
        plt.colorbar(scatter, ax=ax, label='Coverage')
        ax.grid(True, alpha=0.3)

        # (1,1): Metrics at optimal threshold
        ax = axes[1, 1]
        optimal_row = threshold_df[threshold_df['threshold'] == optimal_tau].iloc[0]
        metrics = ['sensitivity', 'specificity', 'accuracy', 'f1']
        values = [optimal_row[m] for m in metrics]
        colors = ['green' if v >= 0.85 else 'orange' if v >= 0.75 else 'red' for v in values]

        ax.barh(metrics, values, color=colors, alpha=0.7)
        ax.set_xlabel('Score', fontsize=12)
        ax.set_title(f'Metrics at Optimal Threshold (τ={optimal_tau:.2f})', fontsize=14, fontweight='bold')
        ax.set_xlim([0, 1])
        ax.axvline(0.85, color='gray', linestyle='--', alpha=0.5)
        for i, v in enumerate(values):
            ax.text(v + 0.02, i, f'{v:.3f}', va='center')

        plt.tight_layout()
        plt.savefig(self.plots_dir / 'sensitivity_analysis_suite.png', dpi=300, bbox_inches='tight')
        plt.close()

    def plot_sample_difficulty_pie(self, difficulty_stats):
        """Plot sample difficulty pie chart"""
        print("  Plotting sample difficulty pie chart...")
        fig, ax = plt.subplots(figsize=(8, 6))

        proportions = difficulty_stats['proportions']
        labels = ['Easy', 'Medium', 'Hard']
        sizes = [proportions['easy'], proportions['medium'], proportions['hard']]
        colors = ['#2ecc71', '#f39c12', '#e74c3c']
        explode = (0.1, 0, 0)  # Emphasize easy portion

        ax.pie(sizes, explode=explode, labels=labels, colors=colors,
               autopct='%1.1f%%', shadow=True, startangle=90)
        ax.set_title('Sample Difficulty Distribution', fontsize=14, fontweight='bold')

        plt.tight_layout()
        plt.savefig(self.plots_dir / 'sample_difficulty_pie.png', dpi=300, bbox_inches='tight')
        plt.close()

    def run_all(self):
        """Run all confidence analyses"""
        print("\n[Confidence Analysis Module]")

        # 1. Extract confidence distribution
        confidence_data = self.extract_confidence_dist()

        # 2. Calibrate threshold
        threshold_df, optimal_tau = self.calibrate_threshold(confidence_data)

        # 3. Stratify sample difficulty
        difficulty_stats = self.stratify_difficulty(confidence_data['confidence_margin'], optimal_tau)

        # 4. Visualization
        self.plot_confidence_distribution(confidence_data)
        self.plot_sensitivity_analysis_suite(threshold_df, optimal_tau)
        self.plot_sample_difficulty_pie(difficulty_stats)

        # 5. Return results
        optimal_row = threshold_df[threshold_df['threshold'] == optimal_tau].iloc[0]

        return {
            'easy_ratio': difficulty_stats['proportions']['easy'],
            'optimal_tau': optimal_tau,
            'sensitivity_at_tau': optimal_row['sensitivity'],
            'specificity_at_tau': optimal_row['specificity'],
            'meets_medical_req': optimal_row['meets_medical_req'],
            'difficulty_stats': difficulty_stats,
            'threshold_df': threshold_df
        }


#============================================================================
# Frequency Analyzer (Simplified Version)
#============================================================================

class FrequencyAnalyzer:
    """Question 4: Time-frequency feature analysis"""

    def __init__(self, dataloader, output_dir):
        self.dataloader = dataloader
        self.output_dir = Path(output_dir)
        self.plots_dir = self.output_dir / 'plots'
        self.data_dir = self.output_dir / 'data'

        self.plots_dir.mkdir(parents=True, exist_ok=True)
        self.data_dir.mkdir(parents=True, exist_ok=True)

    def frequency_band_energy(self):
        """Calculate discriminability of standard EEG frequency bands"""
        print("  Computing frequency band energy...")

        BANDS = {
            'delta': (0.5, 4),
            'theta': (4, 8),
            'alpha': (8, 13),
            'beta': (13, 30),
            'gamma': (30, 100)
        }

        seizure_energy = {band: [] for band in BANDS}
        normal_energy = {band: [] for band in BANDS}

        for x, y in self.dataloader:
            # FFT: (B, 128, 512) -> (B, 128, 257) complex
            fft_result = torch.fft.rfft(x, dim=-1)
            power = torch.abs(fft_result) ** 2

            # Frequency axis: 0 to 128 Hz
            freqs = torch.fft.rfftfreq(512, 1/256)

            for band_name, (low, high) in BANDS.items():
                mask = (freqs >= low) & (freqs < high)
                band_energy = power[:, :, mask].mean(dim=(1,2))

                seizure_energy[band_name].extend(band_energy[y==1].tolist())
                normal_energy[band_name].extend(band_energy[y==0].tolist())

        # Calculate t-statistics
        t_stats = {}
        for band in BANDS:
            if len(seizure_energy[band]) > 0 and len(normal_energy[band]) > 0:
                seiz = np.array(seizure_energy[band])
                norm = np.array(normal_energy[band])
                t_stat, p_val = ttest_ind(seiz, norm)
                t_stats[band] = {
                    't_stat': abs(t_stat),
                    'p_value': p_val,
                    'seizure_mean': seiz.mean(),
                    'normal_mean': norm.mean()
                }

        # Save results
        with open(self.data_dir / 'frequency_band_stats.json', 'w') as f:
            json.dump(t_stats, f, indent=2)

        return t_stats

    def plot_frequency_bands(self, t_stats):
        """Plot frequency band discriminability"""
        print("  Plotting frequency band discriminability...")

        fig, ax = plt.subplots(figsize=(10, 6))

        bands = list(t_stats.keys())
        t_values = [t_stats[band]['t_stat'] for band in bands]
        colors = ['green' if t > 5 else 'orange' if t > 2 else 'red' for t in t_values]

        ax.bar(bands, t_values, color=colors, alpha=0.7)
        ax.axhline(5, color='green', linestyle='--', label='Strong (t>5)')
        ax.axhline(2, color='orange', linestyle='--', label='Moderate (t>2)')
        ax.set_xlabel('Frequency Band', fontsize=12)
        ax.set_ylabel('|t-statistic|', fontsize=12)
        ax.set_title('Frequency Band Discriminability', fontsize=14, fontweight='bold')
        ax.legend()
        ax.grid(True, alpha=0.3, axis='y')

        plt.tight_layout()
        plt.savefig(self.plots_dir / 'frequency_bands.png', dpi=300, bbox_inches='tight')
        plt.close()

    def run_all(self):
        """Run all frequency analyses"""
        print("\n[Frequency Analysis Module]")

        # 1. Frequency band energy analysis
        t_stats = self.frequency_band_energy()

        # 2. Visualization
        self.plot_frequency_bands(t_stats)

        # 3. Return results
        max_band = max(t_stats, key=lambda x: t_stats[x]['t_stat'])

        return {
            't_stats': t_stats,
            'top_band': max_band,
            'max_t_stat': t_stats[max_band]['t_stat']
        }


#============================================================================
# Main Data Analyzer
#============================================================================

class DataAnalyzer:
    """Main coordinator for managing all analysis workflows"""

    def __init__(self, args):
        self.args = args
        self.device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')

        # Create output directories
        self.output_dir = Path(args.output_dir)
        self.output_dir.mkdir(parents=True, exist_ok=True)
        self.checkpoint_dir = Path(args.checkpoint_dir)
        self.checkpoint_dir.mkdir(parents=True, exist_ok=True)

        # Load data
        self.load_data()

        # Initialize model
        self.model = None

    def load_data(self):
        """Load datasets"""
        print("\n[Loading Datasets]")

        # Get experiment configuration
        exp_settings = EXPSettings_SWEC()
        exp_config = exp_settings.exps[self.args.exp_id]

        print(f"  Experiment ID: {self.args.exp_id}")
        print(f"  Train patients: {exp_config['source']}")
        print(f"  Valid patients: {exp_config['valid']}")
        print(f"  Test patients: {exp_config['target']}")

        # Create datasets
        self.args.data_path = Path(self.args.data_path)

        # Training set
        train_dataset = IEEGDataset(
            filenames=exp_config['source'],
            args=self.args,
            mode='train'
        )
        self.train_loader = train_dataset.get_dataloader()

        # Validation set
        valid_dataset = IEEGDataset(
            filenames=exp_config['valid'],
            args=self.args,
            mode='valid'
        )
        self.valid_loader = valid_dataset.get_dataloader()

        # Test set
        test_dataset = IEEGDataset(
            filenames=exp_config['target'],
            args=self.args,
            mode='test'
        )
        self.test_loader = test_dataset.get_dataloader()

        # Compute class ratio
        self.class_ratio = self.compute_class_ratio(self.train_loader)
        print(f"  Class ratio (pos/neg): {self.class_ratio:.3f}")

    def compute_class_ratio(self, loader):
        """Compute class ratio"""
        pos_count = 0
        neg_count = 0
        for _, y in loader:
            pos_count += (y == 1).sum().item()
            neg_count += (y == 0).sum().item()
        return pos_count / neg_count if neg_count > 0 else 1.0

    def train_reference_model(self):
        """Train reference CNN model"""
        print("\n[Training Reference CNN Model]")

        # Create model
        self.model = CNN(F1=self.args.F1, classes_num=2, D=self.args.D).to(self.device)

        # Optimizer
        optimizer = torch.optim.AdamW(
            self.model.parameters(),
            lr=0.0003,
            weight_decay=0.1
        )

        # Training weights
        train_weight = torch.Tensor([self.class_ratio, 1.0]).to(self.device)

        best_f1 = 0.0
        best_state = None

        for epoch in range(self.args.num_epochs):
            # Training
            self.model.train()
            train_loss = 0.0

            for x, y in self.train_loader:
                x, y = x.to(self.device), y.to(self.device)

                optimizer.zero_grad()
                outputs = self.model(x)
                loss = F.cross_entropy(outputs, y, weight=train_weight)
                loss.backward()
                optimizer.step()

                train_loss += loss.item()

            # Validation
            val_metrics = self.evaluate(self.valid_loader)

            print(f"  Epoch {epoch+1}/{self.args.num_epochs} | "
                  f"Loss: {train_loss/len(self.train_loader):.4f} | "
                  f"Val F1: {val_metrics.f_one:.4f} | "
                  f"Val Sens: {val_metrics.sensitivity:.4f}")

            # Save best model
            if val_metrics.f_one > best_f1:
                best_f1 = val_metrics.f_one
                best_state = self.model.state_dict().copy()

        # Load best model
        self.model.load_state_dict(best_state)

        # Save checkpoint
        checkpoint_path = self.checkpoint_dir / f'cnn_exp{self.args.exp_id}_reference.pth'
        torch.save(best_state, checkpoint_path)
        print(f"  Model saved: {checkpoint_path}")

    def load_checkpoint(self, checkpoint_path):
        """Load checkpoint"""
        print(f"\n[Loading Model]: {checkpoint_path}")
        self.model = CNN(F1=self.args.F1, classes_num=2, D=self.args.D).to(self.device)
        self.model.load_state_dict(torch.load(checkpoint_path))

    def evaluate(self, dataloader):
        """Evaluate model"""
        self.model.eval()
        all_preds = []
        all_labels = []

        with torch.no_grad():
            for x, y in dataloader:
                x = x.to(self.device)
                outputs = self.model(x)
                preds = outputs.argmax(dim=1)
                all_preds.append(preds.cpu())
                all_labels.append(y)

        preds = torch.cat(all_preds).numpy()
        labels = torch.cat(all_labels).numpy()

        return Metrics(preds, labels)

    def get_baseline_metrics(self):
        """Get baseline performance"""
        print("\n[Evaluating Baseline CNN Performance]")
        metrics = self.evaluate(self.test_loader)

        print(f"  Accuracy: {metrics.acc:.4f}")
        print(f"  Sensitivity: {metrics.sensitivity:.4f}")
        print(f"  Specificity: {metrics.specificity:.4f}")
        print(f"  F1 Score: {metrics.f_one:.4f}")

        return metrics

    def generate_html_report(self, all_results):
        """Generate HTML report"""
        print("\n[Generating HTML Report]")

        html = f"""
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>iEEG Data Analysis Report - Sensitivity/Specificity Focus</title>
    <style>
        body {{ font-family: Arial, sans-serif; margin: 20px; background-color: #f5f5f5; }}
        .container {{ max-width: 1200px; margin: 0 auto; background: white; padding: 30px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }}
        h1 {{ color: #2c3e50; border-bottom: 3px solid #3498db; padding-bottom: 10px; }}
        h2 {{ color: #34495e; border-bottom: 2px solid #95a5a6; padding-bottom: 5px; margin-top: 30px; }}
        .metric {{ display: inline-block; margin: 10px; padding: 15px; border: 2px solid #bdc3c7; border-radius: 5px; min-width: 150px; }}
        .good {{ background-color: #d5f4e6; border-color: #27ae60; }}
        .warning {{ background-color: #fef5e7; border-color: #f39c12; }}
        .bad {{ background-color: #fadbd8; border-color: #e74c3c; }}
        table {{ border-collapse: collapse; width: 100%; margin: 20px 0; }}
        th, td {{ border: 1px solid #ddd; padding: 12px; text-align: left; }}
        th {{ background-color: #3498db; color: white; }}
        img {{ max-width: 100%; height: auto; margin: 15px 0; border: 1px solid #ddd; border-radius: 5px; }}
        .summary-box {{ background-color: #ecf0f1; padding: 20px; border-radius: 5px; margin: 20px 0; }}
        ul {{ line-height: 1.8; }}
    </style>
</head>
<body>
    <div class="container">
        <h1>iEEG Data Analysis Report</h1>
        <p><strong>分析日期:</strong> {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}</p>
        <p><strong>实验配置:</strong> exp_id={self.args.exp_id}</p>
        <p><strong>评估指标:</strong> Sensitivity (灵敏度) & Specificity (特异度)</p>
        <p><strong>医学标准:</strong> Sensitivity ≥ 0.85 (不漏诊癫痫发作)</p>

        <h2>Executive Summary</h2>

        <h3>当前CNN模型性能</h3>
        <div class="metric {'good' if all_results['cnn']['sensitivity'] >= 0.85 else 'warning'}">
            <strong>Sensitivity:</strong> {all_results['cnn']['sensitivity']:.3f}
        </div>
        <div class="metric {'good' if all_results['cnn']['specificity'] >= 0.80 else 'warning'}">
            <strong>Specificity:</strong> {all_results['cnn']['specificity']:.3f}
        </div>
        <div class="metric">
            <strong>F1 Score:</strong> {all_results['cnn']['f1']:.3f}
        </div>
        <div class="metric">
            <strong>Accuracy:</strong> {all_results['cnn']['accuracy']:.3f}
        </div>

        <h3>关键发现</h3>
        <ul>
            <li><strong>级联可行性:</strong> {all_results['confidence']['easy_ratio']*100:.1f}% 样本高置信度</li>
            <li><strong>最优阈值:</strong> τ = {all_results['confidence']['optimal_tau']:.2f}</li>
            <li><strong>阈值处性能:</strong> Sensitivity = {all_results['confidence']['sensitivity_at_tau']:.3f},
                Specificity = {all_results['confidence']['specificity_at_tau']:.3f}</li>
            <li><strong>医学要求:</strong> {'✓ 满足' if all_results['confidence']['meets_medical_req'] else '✗ 不满足'}
                (Sensitivity {'≥' if all_results['confidence']['sensitivity_at_tau'] >= 0.85 else '<'} 0.85)</li>
            <li><strong>频率特征:</strong> {all_results['frequency']['top_band']} 频段最判别
                (t-stat={all_results['frequency']['max_t_stat']:.2f})</li>
        </ul>

        <div class="summary-box">
            <h3>级联架构建议</h3>
            <p><strong>推荐:</strong> {all_results['recommendation']}</p>
        </div>

        <h2>详细分析</h2>

        <h3>1. 置信度与级联分析 (核心)</h3>
        <p>分析模型对不同样本的预测置信度，确定简单模型可以处理的"easy"样本比例。</p>
        <img src="plots/confidence_distribution.png" alt="Confidence Distribution">
        <img src="plots/sensitivity_analysis_suite.png" alt="Sensitivity Analysis Suite">
        <img src="plots/sample_difficulty_pie.png" alt="Sample Difficulty">

        <h3>2. 频率特征分析</h3>
        <p>分析不同EEG频段（delta, theta, alpha, beta, gamma）的判别力。</p>
        <img src="plots/frequency_bands.png" alt="Frequency Bands">

        <h2>结论与建议</h2>

        <div class="summary-box">
            <h3>基于分析结果的建议：</h3>

            <p><strong>1. 级联可行性判断</strong></p>
            <ul>
                <li>高置信度样本比例: {all_results['confidence']['easy_ratio']*100:.1f}%</li>
                <li>{'✓ 建议使用级联架构' if all_results['confidence']['easy_ratio'] > 0.6 else '✗ 不建议级联，收益不明显'}</li>
            </ul>

            <p><strong>2. 简单模型设计建议</strong></p>
            <ul>
                <li>频率特征判别力: {all_results['frequency']['top_band']} 频段 t-stat={all_results['frequency']['max_t_stat']:.2f}</li>
                <li>{'推荐使用FFT+MLP (Option B)' if all_results['frequency']['max_t_stat'] > 5.0 else '推荐使用轻量1D CNN (Option A)'}</li>
            </ul>

            <p><strong>3. 性能保证</strong></p>
            <ul>
                <li>必须确保简单模型在easy样本上的sensitivity ≥ 0.85</li>
                <li>复杂模型处理hard样本以保证整体sensitivity</li>
            </ul>
        </div>

        <hr>
        <p><em>Generated by analyze_data.py | Environment: {detect_environment()}</em></p>
    </div>
</body>
</html>
"""

        report_path = self.output_dir / 'report.html'
        with open(report_path, 'w', encoding='utf-8') as f:
            f.write(html)

        print(f"  HTML report generated: {report_path}")


#============================================================================
# Command Line Interface and Main Function
#============================================================================

def get_args():
    parser = argparse.ArgumentParser(
        description='SWEC Data Analysis - Sensitivity/Specificity Focus'
    )

    # Environment and data
    env = detect_environment()
    defaults = get_default_paths(env)

    parser.add_argument('--data_path', type=str, default=defaults['data_path'],
                       help='Data path')
    parser.add_argument('--exp_id', type=int, default=3,
                       help='Experiment ID (1-13)')
    parser.add_argument('--checkpoint_path', type=str, default=None,
                       help='CNN checkpoint path')
    parser.add_argument('--train_reference', type=int, default=1,
                       help='Train reference CNN (1=yes, 0=no)')

    # Model parameters
    parser.add_argument('--F1', type=int, default=16)
    parser.add_argument('--D', type=int, default=2)
    parser.add_argument('--batch_size', type=int, default=32)
    parser.add_argument('--num_epochs', type=int, default=10)
    parser.add_argument('--seed', type=int, default=42)
    parser.add_argument('--segment_length', type=int, default=500)
    parser.add_argument('--sum_up_length', type=int, default=5)

    # Output
    parser.add_argument('--output_dir', type=str, default=defaults['output_dir'],
                       help='Output directory')
    parser.add_argument('--checkpoint_dir', type=str, default=defaults['checkpoint_dir'],
                       help='Checkpoint directory')

    # Analysis options
    parser.add_argument('--medical_sensitivity_threshold', type=float, default=0.85,
                       help='Minimum sensitivity threshold for medical requirements')

    return parser.parse_args()


def main():
    args = get_args()
    init_seed(args.seed)

    print("="*70)
    print(" iEEG Data Analysis - Sensitivity/Specificity Focus")
    print("="*70)
    env = detect_environment()
    print(f"Environment: {env}")
    print(f"Data path: {args.data_path}")
    print(f"Output dir: {args.output_dir}")
    print(f"Medical sensitivity threshold: {args.medical_sensitivity_threshold}")
    print(f"Device: {'CUDA' if torch.cuda.is_available() else 'CPU'}")
    print("="*70)

    # 1. Initialize analyzer
    analyzer = DataAnalyzer(args)

    # 2. Load or train reference model
    if args.checkpoint_path is None and args.train_reference:
        analyzer.train_reference_model()
    else:
        analyzer.load_checkpoint(args.checkpoint_path)

    # 3. Get baseline performance
    baseline_metrics = analyzer.get_baseline_metrics()

    # 4. Confidence analysis - Core module
    print("\n" + "="*70)
    print(" Confidence and Cascade Feasibility Analysis (Sensitivity/Specificity)")
    print("="*70)
    confidence_analyzer = ConfidenceAnalyzer(
        analyzer.model,
        analyzer.test_loader,
        analyzer.output_dir
    )
    confidence_results = confidence_analyzer.run_all()

    print(f"\n[Confidence Analysis Results]")
    print(f"  - Easy sample ratio: {confidence_results['easy_ratio']*100:.1f}%")
    print(f"  - Optimal threshold: {confidence_results['optimal_tau']:.2f}")
    print(f"  - Sensitivity at threshold: {confidence_results['sensitivity_at_tau']:.3f}")
    print(f"  - Specificity at threshold: {confidence_results['specificity_at_tau']:.3f}")
    print(f"  - Meets medical requirements: {'✓' if confidence_results['meets_medical_req'] else '✗'}")

    # 5. Frequency analysis
    print("\n" + "="*70)
    print(" Time-Frequency Feature Analysis")
    print("="*70)
    frequency_analyzer = FrequencyAnalyzer(analyzer.test_loader, analyzer.output_dir)
    frequency_results = frequency_analyzer.run_all()

    print(f"\n[Frequency Analysis Results]")
    print(f"  - Most discriminative band: {frequency_results['top_band']}")
    print(f"  - Max t-statistic: {frequency_results['max_t_stat']:.2f}")

    # 6. Generate recommendation
    print("\n" + "="*70)
    print(" Model Recommendation")
    print("="*70)

    if confidence_results['easy_ratio'] < 0.6:
        recommendation = "Cascade NOT recommended - easy sample ratio < 60%"
    elif frequency_results['max_t_stat'] > 5.0:
        recommendation = f"Recommend Option B: FFT + MLP - {frequency_results['top_band']} band shows strong discriminability"
    else:
        recommendation = "Recommend Option A: Lightweight 1D CNN - balanced performance and complexity"

    print(f"\nRecommendation: {recommendation}")

    # 7. Generate report
    print("\n" + "="*70)
    print(" Generating Analysis Report")
    print("="*70)

    all_results = {
        'cnn': {
            'sensitivity': baseline_metrics.sensitivity,
            'specificity': baseline_metrics.specificity,
            'f1': baseline_metrics.f_one,
            'accuracy': baseline_metrics.acc
        },
        'confidence': confidence_results,
        'frequency': frequency_results,
        'recommendation': recommendation
    }

    analyzer.generate_html_report(all_results)

    # 8. Summary
    print("\n" + "="*70)
    print(" Analysis Complete!")
    print("="*70)
    print(f"\nOutput directory: {args.output_dir}")
    print(f"  - HTML report: report.html")
    print(f"  - Plots: plots/")
    print(f"  - Data: data/")

    if env == 'remote':
        print(f"\nSync results to local:")
        print(f"  scp -r hdeng@inlsrv3:{args.output_dir} ./local_results/")

    print("\n" + "="*70)


if __name__ == '__main__':
    main()
