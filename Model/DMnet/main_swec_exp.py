import argparse
import os
import json
import random
import torch
import torch.nn as nn
import torch.nn.functional as F
from tqdm import tqdm
from sklearn.metrics import confusion_matrix
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import warnings
from baselines import *

# --- Assumed Project Imports ---
from dataset_swec import IEEGDataset
from exp_settings import EXPSettings_SWEC
from utils.evaluation import Metrics
from DMnet import * # Ensure your model classes are here
from modules import *
from loss import FocalLoss

warnings.filterwarnings('ignore')

def init_seed(seed=42):
    torch.manual_seed(seed)
    torch.cuda.manual_seed(seed)
    torch.cuda.manual_seed_all(seed)
    torch.backends.cudnn.deterministic = True
    torch.backends.cudnn.benchmark = False
    np.random.seed(seed)
    random.seed(seed)

def count_parameters(model):
    return sum(p.numel() for p in model.parameters() if p.requires_grad)

def plot_kde_distribution(labels, preds, phase="Test"):
    """
    Visualizes the density of seizure occurrences over the timeline.
    Overlap between curves shows temporal alignment of predictions.
    """
    plt.figure(figsize=(10, 5))
    
    # Extract indices where seizures occur
    actual_idx = np.where(labels == 1)[0]
    pred_idx = np.where(preds == 1)[0]
    
    if len(actual_idx) > 0:
        sns.kdeplot(actual_idx, label='Actual Seizures', fill=True, color="royalblue", alpha=0.4, bw_adjust=0.5)
    if len(pred_idx) > 0:
        sns.kdeplot(pred_idx, label='Predicted Seizures', fill=True, color="crimson", alpha=0.4, bw_adjust=0.5)
    
    plt.title(f"Seizure Event Density: {phase} Set", fontsize=14)
    plt.xlabel("Segment Index (Timeline)")
    plt.ylabel("Density")
    plt.legend()
    plt.grid(axis='y', linestyle='--', alpha=0.3)
    plt.tight_layout()
    plt.show()

def validation(validation_loader, model, val_ratio):
    model.eval()
    tot_loss = 0
    tot_labels, tot_preds = [], []
    weight = torch.Tensor([args.ratio, 1.0]).cuda()

    with torch.no_grad():
        for batches in tqdm(validation_loader, desc="Validating", leave=False):
            x, y = batches
            x, y = x.cuda(), y.cuda()
            outputs = model(x)
            loss = F.cross_entropy(outputs, y.view(-1), weight=weight)
            tot_loss += loss.item()
            pred = torch.max(outputs, dim=-1)[1]
            tot_labels += y.view(-1).cpu().numpy().tolist()
            tot_preds += pred.cpu().numpy().tolist()

        metrics = Metrics(tot_preds, tot_labels)
        return tot_loss / len(validation_loader), metrics.acc

def evaluate_and_get_results(loader, model, model_best_state, phase="Evaluation", threshold=0.5):
    """
    Inference pass: prints Confusion Matrix, returns Metrics and raw arrays.
    """
    model.load_state_dict(model_best_state)
    model.cuda()
    model.eval()

    tot_labels, tot_probs = [], []

    with torch.no_grad():
        for batches in tqdm(loader, desc=f"Final Eval: {phase}", leave=False):
            x, y = batches
            x, y = x.cuda(), y.cuda()
            outputs = model(x)
            probs = torch.softmax(outputs, dim=1)[:, 1]
            tot_labels.extend(y.view(-1).cpu().numpy())
            tot_probs.extend(probs.cpu().numpy())

    tot_labels = np.array(tot_labels)
    preds = (np.array(tot_probs) >= threshold).astype(int)
    
    # 1. Print Confusion Matrix
    cm = confusion_matrix(tot_labels, preds)
    print(f"\n[{phase}] Confusion Matrix:")
    print(cm)
    
    # 2. Calculate Metrics
    metric = Metrics(preds, tot_labels)
    res = {
        'acc': metric.acc,
        'f1': metric.f_one,
        'prec': metric.prec,
        'rec': metric.rec,
        'auroc': metric.auroc, 
        'specificity': metric.specificity,
        'sensitivity': metric.sensitivity,
    }
    return res, tot_labels, preds

def fit(train_loader, valid_loader, optimizer, model, args, val_ratio): 
    best_val_acc = -1
    model_best_state = None
    train_weight = torch.Tensor([args.ratio, 1.0]).cuda()

    for epoch in range(args.num_epochs):
        model.train()
        tot_loss = 0
        pbar = tqdm(train_loader, desc=f"Epoch {epoch}", leave=True)
        for batches in pbar:
            x, y = batches
            x, y = x.cuda(), y.cuda()
            outputs = model(x)
            loss = F.cross_entropy(outputs, y.view(-1), weight=train_weight)
            tot_loss += loss.item()
            loss.backward()
            optimizer.step()
            optimizer.zero_grad()
            pbar.set_postfix({'loss': f"{loss.item():.4f}"})

        if (epoch + 1) % 5 == 0: 
            val_loss, val_acc = validation(valid_loader, model, val_ratio)
            if val_acc > best_val_acc:
                print(f" -> Best model updated | Val Acc: {val_acc:.4f}")
                best_val_acc = val_acc
                model_best_state = model.state_dict()
    
    return best_val_acc, model_best_state

def class_ratio(loader):
    y_list = [y_.reshape(-1) for _, y_ in loader]
    y = torch.concat(y_list).reshape(-1)
    pos = torch.sum(y == 1)
    neg = torch.sum(y == 0)
    return (pos / neg).item() if neg > 0 else 1.0

def run_experiment(args):
    exp_settings = EXPSettings_SWEC()
    train_filenames = exp_settings.exps[args.exp_id]['source']
    valid_filenames = exp_settings.exps[args.exp_id]['valid']
    test_filenames = exp_settings.exps[args.exp_id]['target']

    train_loader = IEEGDataset(train_filenames, args, mode='train').get_dataloader()
    valid_loader = IEEGDataset(valid_filenames, args, mode='val').get_dataloader()
    test_loader  = IEEGDataset(test_filenames,  args, mode='test').get_dataloader()

    args.ratio = class_ratio(train_loader)
    val_ratio  = class_ratio(valid_loader)

    print(f"Class Ratios - Train: {args.ratio:.4f}, Valid: {val_ratio:.4f}")

    # Replace CNN with your specific model class if different
    model = CNN(F1=args.F1, classes_num=2, D=args.D).cuda()
    # model = EEGNet(F1=16, D=3).cuda()
    optimizer = torch.optim.AdamW(model.parameters(), lr=args.learning_rate, weight_decay=0.1)

    if args.is_training == 1:
        best_val_acc, best_state = fit(train_loader, valid_loader, optimizer, model, args, val_ratio)

        if best_state is not None:
            # --- FINAL TRAIN EVALUATION ---
            train_metrics, train_labels, train_preds = evaluate_and_get_results(
                train_loader, model, best_state, phase="TRAIN"
            )
            plot_kde_distribution(train_labels, train_preds, phase="TRAIN")

            # --- FINAL TEST EVALUATION ---
            test_metrics, test_labels, test_preds = evaluate_and_get_results(
                test_loader, model, best_state, phase="TEST"
            )
            plot_kde_distribution(test_labels, test_preds, phase="TEST")
            
            return best_val_acc, test_metrics, train_metrics
            
    return best_val_acc, {}, {}

def get_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("--gpu_id", type=int, default=1)
    parser.add_argument("--exp_id", type=int, default=3)
    parser.add_argument("--is_training", type=int, default=1)
    parser.add_argument("--learning_rate", type=float, default=3e-4) 
    parser.add_argument("--num_epochs", type=int, default=10)
    parser.add_argument("--batch_size", type=int, default=32)
    parser.add_argument("--seed", type=int, default=42)
    parser.add_argument("--F1", type=int, default=16)
    parser.add_argument("--D", type=int, default=2)
    parser.add_argument("--segment_length", type=int, default=500)
    parser.add_argument("--sum_up_length", type=int, default=5)
    parser.add_argument("--run_all", type=int, default=0)
    return parser.parse_args()

if __name__ == '__main__':
    args = get_args()
    init_seed(args.seed)
    args.data_path = f"/scratch/Arya/SWEC/"

    if args.run_all == 1:
        for i in range(1, 14):
            args.exp_id = i
            run_experiment(args)
    else:
        v_acc, t_res, tr_res = run_experiment(args)
        print("\n" + "="*40)
        print(f"FINAL SUMMARY FOR EXP {args.exp_id}")
        print(f"Best Validation Accuracy: {v_acc:.4f}")
        print("-" * 40)
        print(f"Train F1 Score: {tr_res.get('f1', 0):.4f}")
        # print(f"Test F1 Score:  {t_res.get('f1', 0):.4f}")
        # print(f"Test AUROC:     {t_res.get('auroc', 0):.4f}")

        # print all test 
        for metric_name, metric_value in t_res.items():
            print(f"Test {metric_name.upper()}: {metric_value:.4f}")
        print("="*40)