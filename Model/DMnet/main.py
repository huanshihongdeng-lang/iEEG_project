import argparse
import os
import json
import random
from time import time
import torch
import torch.nn as nn
import torch.nn.functional as F
from tqdm import tqdm
from sklearn.metrics import confusion_matrix, roc_auc_score
import numpy as np
import warnings
import matplotlib.pyplot as plt
from baselines import *

# --- Assumed Imports ---
from test import *
from dataset import IEEGDataset, SubDataset
from exp_settings import ExpSettings_MAYO, ExpSettings_FNUSA, EXPSettings_SWEC
from utils.evaluation import Metrics
from DMnet import *
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

def validation(validation_loader, model):
    model.eval()
    with torch.no_grad():
        tot_labels, tot_preds = [], []
        for batches in tqdm(validation_loader, desc="Validating", leave=False):
            x, y, ssp = batches
            x, y, ssp = x.cuda(), y.cuda(), ssp.cuda()
            # y = torch.repeat_interleave(y, repeats=x.shape[1], dim=0)
            outputs = model(x, ssp)
            pred = torch.max(outputs, dim=-1)[1]
            tot_labels += y.view(-1).cpu().numpy().tolist()
            tot_preds += pred.cpu().numpy().tolist()

        metrics = Metrics(tot_preds, tot_labels)
        return metrics.f_one

def test(test_loader, model, model_best_state):
    model.load_state_dict(model_best_state)
    model.cuda()
    model.eval()

    with torch.no_grad():
        start_time = time()
        tot_labels, tot_preds, tot_logits = [], [], []

        for batches in tqdm(test_loader, desc="Testing", leave=True):
            x, y, ssp = batches
            x, y, ssp = x.cuda(), y.cuda(), ssp.cuda()
            # y = torch.repeat_interleave(y, repeats=x.shape[1], dim=0)
            outputs = model(x, ssp)
            pred = torch.max(outputs, dim=-1)[1]

            tot_labels += y.view(-1).cpu().numpy().tolist()
            tot_preds += pred.cpu().numpy().tolist()
            tot_logits.append(outputs)

        tot_labels = np.array(tot_labels).reshape(-1)
        tot_preds = np.array(tot_preds).reshape(-1)
        tot_logits = torch.cat(tot_logits, dim=0).cpu().numpy()

        auroc = roc_auc_score(tot_labels, tot_logits[:, 1])
        metric = Metrics(tot_preds, tot_labels)

        res = {
            'acc': metric.acc,
            'f1': metric.f_one,
            'f2': metric.f_doub,
            'auroc': auroc,
        }
    return res

def fit(train_loader, valid_loader, optimizer, model, args):
    best_f1 = -1
    model_best_state = None

    for epoch in range(args.num_epochs):
        model.train()
        tot_loss = 0
        
        # Main training loop
        pbar = tqdm(train_loader, desc=f"Epoch {epoch}", leave=True)
        
        for batches in pbar:
            x, y, ssp = batches
            x, y, ssp = x.cuda(), y.cuda(), ssp.cuda()

            outputs = model(x, ssp)
            # y = torch.repeat_interleave(y, repeats=x.shape[1], dim=0)
            
            loss = F.cross_entropy(outputs, y.view(-1), weight=torch.Tensor([args.ratio, 1]).cuda())

            tot_loss += loss.item()
            loss.backward()
            optimizer.step()
            optimizer.zero_grad()
            
            pbar.set_postfix({'loss': loss.item()})

        # Validation step
        dev_f1 = validation(valid_loader, model)

        if dev_f1 > best_f1:
            best_f1 = dev_f1
            model_best_state = model.state_dict()

    return best_f1, model_best_state

def class_ratio(loader):
    # Calculates ratio silently (no print, no tqdm)
    y = []
    for _, y_, _ in tqdm(loader):
        y.append(y_.reshape(-1))
    y = torch.concat(y).reshape(-1)
    pos = torch.sum(y == 1)
    neg = torch.sum(y == 0)
    return pos / neg

def run_experiment(args):
    if args.dataset_name == 'MAYO':
        exp_settings = ExpSettings_MAYO()
    elif args.dataset_name == 'FNUSA':
        exp_settings = ExpSettings_FNUSA()
    elif args.dataset_name == 'SWEC':
        exp_settings = EXPSettings_SWEC()

    train_filenames = exp_settings.exps[args.exp_id]['source']
    valid_filenames = exp_settings.exps[args.exp_id]['valid']
    test_filenames = exp_settings.exps[args.exp_id]['target']

    train_loader = IEEGDataset(train_filenames, args).get_dataloader()
    valid_loader = IEEGDataset(valid_filenames, args).get_dataloader()
    test_loader = IEEGDataset(test_filenames, args).get_dataloader()

    args.ratio = class_ratio(train_loader)
    # Ratio print removed
    print("Class ratio (pos/neg):", args.ratio)
    


    # model = PyramidTransformer(args).cuda()
    # model = DMNet(args).cuda()

    model = CNN(F1=16, classes_num=2, D=2).cuda()
    # model = DMNet(args).cuda()
    
    # Restored Parameter Count Print
    # print("n_params:", count_parameters(model))

    optimizer = torch.optim.Adam(model.parameters(), lr=args.learning_rate)

    best_val_f1 = 0
    test_res = {}

    if args.is_training == 1:
        best_val_f1, best_state = fit(train_loader, valid_loader, optimizer, model, args)
        if best_state is not None:
            test_res = test(test_loader, model, best_state)
            
    return best_val_f1, test_res

def get_args():
    parser = argparse.ArgumentParser(description='DM')
    parser.add_argument("--gpu_id", type=int, default=1)
    parser.add_argument("--exp_id", type=int, default=1)
    parser.add_argument("--segment_num", type=int, default=7)
    parser.add_argument("--is_training", type=int, default=1)
    parser.add_argument("--segment_length", type=int, default=500)
    parser.add_argument("--sum_up_length", type=int, default=5)
    parser.add_argument("--is_contextual", type=int, default=1)
    parser.add_argument("--is_channel_level", type=int, default=0)
    parser.add_argument("--diff_norm", type=str, default='min_max')
    parser.add_argument("--dataset_name", type=str, default='MAYO')
    parser.add_argument("--diff_sign", type=int, default=1)
    parser.add_argument("--cnn_norm", type=str, default='batch_normalization')
    parser.add_argument("--is_cnn", type=int, default=1)
    parser.add_argument("--k", type=int, default=8)
    parser.add_argument("--h_c", type=int, default=12)
    parser.add_argument("--is_dm", type=int, default=1)
    parser.add_argument("--is_fr", type=int, default=1)
    parser.add_argument("--run_all", type=int, default=0)
    parser.add_argument("--learning_rate", type=float, default=3e-4)
    parser.add_argument("--num_epochs", type=int, default=5)
    parser.add_argument("--batch_size", type=int, default=256)
    parser.add_argument("--seed", type=int, default=42)
    parser.add_argument("--num_layer", type=int, default=3)
    parser.add_argument("--hidden_dim", type=int, default=32)


    parser.add_argument("--F1", type=int, default=16)
    parser.add_argument("--D", type=int, default=2)
    return parser.parse_args()

if __name__ == '__main__':
    args = get_args()
    init_seed(args.seed)
    
    args.save_path = f'/scratch/Arya/{args.dataset_name}_tuned/'
    args.data_path = f"/scratch/Arya/Processed_{args.dataset_name}/"

    if args.run_all == 1:
        val_scores = []
        test_results_list = []
        
        for i in range(1, 7):
            args.exp_id = i
            print(f"\n--- Running Experiment {i}/6 ---")
            v_score, t_res = run_experiment(args)
            
            print(f"Exp {i} Results: {t_res}")
            
            val_scores.append(v_score)
            test_results_list.append(t_res)

        avg_val = sum(val_scores) / len(val_scores)
        avg_test = {key: sum(res[key] for res in test_results_list) / len(test_results_list) 
                    for key in test_results_list[0].keys()}

        print('\n=== Average results over all experiments ===')
        print(avg_test)
        print(f"Average validation score: {avg_val}")

    else:
        v_score, t_res = run_experiment(args)
        print(f"Validation F1: {v_score}")
        print("Test Result:", t_res)