import argparse
import os
import json
import random
from time import time
import torch
import torch.nn as nn
import torch.nn.functional as F
from tqdm import tqdm
from sklearn.metrics import confusion_matrix, roc_auc_score, precision_recall_curve, roc_curve, precision_recall_fscore_support
import numpy as np
import warnings
# import matplotlib.pyplot as plt
from baselines import *

# --- Assumed Imports ---
from test import *
from dataset_swec import IEEGDataset
from exp_settings import ExpSettings_MAYO, ExpSettings_FNUSA, EXPSettings_SWEC
from utils.evaluation import Metrics
from DMnet import *
from modules import *
from loss import FocalLoss

warnings.filterwarnings('ignore')
total_losses = []

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

def validation(validation_loader, model, val_ratio):
    """
    Returns:
        avg_loss (float): The average validation loss.
        acc (float): The validation accuracy (for logging).
    """
    model.eval()
    tot_loss = 0
    tot_labels, tot_preds = [], []
    
    # Use VALIDATION specific ratio for the loss weight
    weight = torch.Tensor([val_ratio, 1.0]).cuda()

    with torch.no_grad():
        for batches in tqdm(validation_loader, desc="Validating", leave=False):
            x, y = batches
            x, y = x.cuda(), y.cuda()
            
            outputs = model(x)
            
            # Calculate Loss using VALIDATION weights
            loss = F.cross_entropy(outputs, y.view(-1), weight=weight)
            tot_loss += loss.item()

            pred = torch.max(outputs, dim=-1)[1]
            tot_labels += y.view(-1).cpu().numpy().tolist()
            tot_preds += pred.cpu().numpy().tolist()

        metrics = Metrics(tot_preds, tot_labels)
        avg_loss = tot_loss / len(validation_loader)
        
        return avg_loss, metrics.acc


def test(test_loader, model, model_best_state, threshold=0.5, min_consecutive=6):
    model.load_state_dict(model_best_state)
    model.cuda()
    model.eval()

    tot_labels, tot_probs = [], []

    with torch.no_grad():
        for batches in tqdm(test_loader, desc="Testing", leave=True):
            x, y = batches
            x, y = x.cuda(), y.cuda()
            outputs = model(x)
            probs = torch.softmax(outputs, dim=1)[:, 1]

            tot_labels.extend(y.view(-1).cpu().numpy())
            tot_probs.extend(probs.cpu().numpy())

        tot_labels = np.array(tot_labels)
        tot_probs  = np.array(tot_probs)

        raw_preds = (tot_probs >= threshold).astype(int)

        smooth_preds = raw_preds 


        segments = np.arange(len(tot_labels))
        metric = Metrics(smooth_preds, tot_labels)

        print("\nConfusion Matrix:")
        cm = confusion_matrix(tot_labels, smooth_preds)
        print(cm)

        return {
            'acc': metric.acc,
            'f1': metric.f_one,
            'f2': metric.f_doub,
            'precision': metric.prec,
            'recall': metric.rec,
            'auroc': metric.auroc,
            'sensitivity': metric.sensitivity,
            'specificity': metric.specificity
        }

def fit(train_loader, valid_loader, optimizer, model, args, val_ratio): 
    best_val_acc = -1
    model_best_state = None
    global total_losses

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
            
            pbar.set_postfix({'loss': loss.item()})

        avg_train_loss = tot_loss / len(train_loader)
        total_losses.append(avg_train_loss)

        if (epoch + 1) % 5 == 0: 

            val_loss, val_acc = validation(valid_loader, model, val_ratio)

            if val_acc > best_val_acc:
                print(f"New best model found at epoch {epoch} | Val Acc: {val_acc:.4f} (Loss: {val_loss:.4f})")
                best_val_acc = val_acc
                model_best_state = model.state_dict()
    
    return best_val_acc, model_best_state

def class_ratio(loader):
    y = []
    for _, y_ in loader:
        y.append(y_.reshape(-1))
    y = torch.concat(y).reshape(-1)
    
    pos = torch.sum(y == 1)
    neg = torch.sum(y == 0)
    
    if neg == 0: return 1.0
    return pos / neg

def run_experiment(args):
    exp_settings = EXPSettings_SWEC()

    train_filenames = exp_settings.exps[args.exp_id]['source']
    valid_filenames = exp_settings.exps[args.exp_id]['valid']
    test_filenames = exp_settings.exps[args.exp_id]['target']

    train_loader = IEEGDataset(train_filenames, args, mode = 'train').get_dataloader()
    valid_loader = IEEGDataset(valid_filenames, args, mode = 'val').get_dataloader()
    test_loader  = IEEGDataset(test_filenames,  args, mode = 'test').get_dataloader()

    # 1. Calculate Training Ratio
    args.ratio = class_ratio(train_loader)
    print(f"Class Ratio (pos/neg) in training set: {args.ratio:.4f}")

    # 2. Calculate Validation Ratio
    val_ratio = class_ratio(valid_loader)
    print(f"Class Ratio (pos/neg) in validation set: {val_ratio:.4f}")

    test_ratio = class_ratio(test_loader)
    print(f"Class Ratio (pos/neg) in test set: {test_ratio:.4f}")

    model = CNN(F1=16, classes_num=2, D=2).cuda()
    # model(torch.randn(2, 128, 512).cuda()) 
    # model = SEEGNet(128, 2).cuda()
    print("n_params:", count_parameters(model))

    optimizer = torch.optim.AdamW(model.parameters(), lr=args.learning_rate, weight_decay=0.1)

    best_val_loss = 0
    test_res = {}

    if args.is_training == 1:
        
        best_val_acc, best_state = fit(train_loader, valid_loader, optimizer, model, args, val_ratio)

        if best_state is not None:
            test_res = test(test_loader, model, best_state)
            
    return best_val_acc, test_res

def get_args():
    parser = argparse.ArgumentParser(description='DM')
    parser.add_argument("--gpu_id", type=int, default=1)
    parser.add_argument("--exp_id", type=int, default=3)
    parser.add_argument("--segment_num", type=int, default=7)
    parser.add_argument("--is_training", type=int, default=1)
    parser.add_argument("--segment_length", type=int, default=500)
    parser.add_argument("--sum_up_length", type=int, default=5)
    parser.add_argument("--is_contextual", type=int, default=1)
    parser.add_argument("--is_channel_level", type=int, default=0)
    parser.add_argument("--diff_norm", type=str, default='min_max')
    parser.add_argument("--diff_sign", type=int, default=1)
    parser.add_argument("--cnn_norm", type=str, default='batch_normalization')
    parser.add_argument("--is_cnn", type=int, default=1)
    parser.add_argument("--k", type=int, default=8)
    parser.add_argument("--h_c", type=int, default=12)
    parser.add_argument("--is_dm", type=int, default=1)
    parser.add_argument("--is_fr", type=int, default=1)
    parser.add_argument("--run_all", type=int, default=0)
    parser.add_argument("--learning_rate", type=float, default=3e-4) 
    parser.add_argument("--num_epochs", type=int, default=10)
    parser.add_argument("--batch_size", type=int, default=32)
    parser.add_argument("--seed", type=int, default=42)
    parser.add_argument("--num_layer", type=int, default=3)
    parser.add_argument("--hidden_dim", type=int, default=32)

    parser.add_argument("--F1", type=int, default=16)
    parser.add_argument("--D", type=int, default=2)
    return parser.parse_args()

if __name__ == '__main__':
    args = get_args()
    init_seed(args.seed)
    
    args.data_path = f"/scratch/Arya/SWEC/"

    if args.run_all == 1:
        val_scores = []
        test_results_list = []
        
        for i in range(1, 14):
            args.exp_id = i
            print(f"\n--- Running Experiment {i}/6 ---")
            v_score, t_res = run_experiment(args)
            
            print(f"Exp {i} Results: {t_res}")
            
            val_scores.append(v_score)
            test_results_list.append(t_res)

        print('\n=== Average results over all experiments ===')
        if test_results_list:
            avg_test = {key: sum(res[key] for res in test_results_list) / len(test_results_list) 
                        for key in test_results_list[0].keys()}
            print(avg_test)
        print(f"Average validation loss: {sum(val_scores) / len(val_scores)}")

    else:
        v_acc, t_res = run_experiment(args)
        print(f"Best Validation accuracy: {v_acc}")
        print("Test Result:", t_res)