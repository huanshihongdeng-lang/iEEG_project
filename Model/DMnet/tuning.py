# import pandas as pd
# import itertools
# import torch
# import gc
# from main import get_args, run_experiment, init_seed

# def run_tuning():
#     # 1. Hyperparameter Grid
#     param_grid = {
#         'batch_size': [32, 64, 128, 256],
#         'h_c': [4, 8, 12],
#         'num_epochs': [5, 10, 15],
#         'dataset_name': ['MAYO', 'FNUSA']
#     }

#     # Generate all combinations
#     keys, values = zip(*param_grid.items())
#     combinations = [dict(zip(keys, v)) for v in itertools.product(*values)]

#     print(f"Total combinations to test: {len(combinations)}")
    
#     # Get base arguments
#     args = get_args()
    
#     results = []
    
#     # 2. Iterate through combinations
#     for i, params in enumerate(combinations):
#         print(f"\n##################################################")
#         print(f"Combination {i+1}/{len(combinations)}: {params}")
#         print(f"##################################################")

#         # Update args with current combination
#         args.batch_size = params['batch_size']
#         args.h_c = params['h_c']
#         args.num_epochs = params['num_epochs']
#         args.dataset_name = params['dataset_name']
        
#         # Crucial: Update data path and save path based on the dataset name
#         args.data_path = f"/scratch/Arya/Processed_{args.dataset_name}/"
#         args.save_path = f'/scratch/Arya/{args.dataset_name}_tuned/'
        
#         # RESET SEED: Ensures fair comparison (same initialization for every config)
#         init_seed(args.seed)

#         val_scores = []
#         test_results_list = []
        
#         try:
#             # Run all 6 folds (experiments) for this specific hyperparameter set
#             for exp_id in range(1, 7):
#                 args.exp_id = exp_id
#                 print(f"--> Fold {exp_id}/6 ... ", end="", flush=True)
                
#                 # Run the experiment
#                 # (Note: main.py functions are imported directly)
#                 val_f1, t_res = run_experiment(args) 
                
#                 print(f"Done. Val F1: {val_f1:.4f} | Test F1: {t_res['f1']:.4f}")
                
#                 val_scores.append(val_f1)
#                 test_results_list.append(t_res)

#                 # Cleanup GPU memory between folds to prevent OOM
#                 torch.cuda.empty_cache()
#                 gc.collect()
            
#             # Calculate averages
#             avg_val_score = sum(val_scores) / len(val_scores)
#             avg_test_f1 = sum(r['f1'] for r in test_results_list) / len(test_results_list)
            
#             # Prepare log entry
#             log_entry = params.copy()
#             log_entry['avg_validation_f1'] = avg_val_score
#             log_entry['avg_test_f1'] = avg_test_f1
            
#             # Add all other test metrics if you want them
#             log_entry['avg_test_acc'] = sum(r['acc'] for r in test_results_list) / len(test_results_list)
#             log_entry['avg_test_auroc'] = sum(r['auroc'] for r in test_results_list) / len(test_results_list)
            
#             results.append(log_entry)
            
#             print(f"*** COMBO RESULT: Avg Val F1: {avg_val_score:.4f} ***")

#             # Save incrementally to CSV (prevents data loss if crash)
#             df = pd.DataFrame(results)
#             df.to_csv('tuning_results.csv', index=False)

#         except Exception as e:
#             print(f"\n!!! Error in combination {params}: {e}")
#             # Save what we have so far even if it crashes
#             if results:
#                 df = pd.DataFrame(results)
#                 df.to_csv('tuning_results.csv', index=False)
#             continue

#     print("\n\n--- Tuning Complete ---")
#     if results:
#         df = pd.DataFrame(results)
#         best_run = df.loc[df['avg_validation_f1'].idxmax()]
#         print("Best Run based on Validation F1:")
#         print(best_run)

# if __name__ == "__main__":
#     run_tuning()


import pandas as pd
import itertools
import torch
import gc
import sys

# Assumed imports from your project structure
from main import get_args, run_experiment, init_seed

def run_tuning():
    # 1. Hyperparameter Grid
    # Total combinations: 4 (batch) * 3 (epoch) * 2 (data) * 3 (hidden) * 3 (layer) = 216 combos
    param_grid = {
        'batch_size': [256],
        'num_epochs': [10],
        'dataset_name': ['MAYO', 'FNUSA'],
        'F1': [8, 16, 32],
        'D': [1, 2, 3]
    }

    # Generate all combinations
    keys, values = zip(*param_grid.items())
    combinations = [dict(zip(keys, v)) for v in itertools.product(*values)]

    print(f"Total combinations to test: {len(combinations)}")
    print(f"Total individual folds to run: {len(combinations) * 6}")
    
    # Get base arguments
    # Ensure main.py has num_layer as an optional argument (--num_layer) 
    # or this call might fail if no command line arg is provided.
    args = get_args()
    
    results = []
    
    # 2. Iterate through combinations
    for i, params in enumerate(combinations):
        print(f"\n##################################################")
        print(f"Combination {i+1}/{len(combinations)}: {params}")
        print(f"##################################################")

        # Update args with current combination
        args.batch_size = params['batch_size']
        args.num_epochs = params['num_epochs']
        args.dataset_name = params['dataset_name']
        
        # New model-specific parameters
        args.F1 = params['F1']
        args.D = params['D']
        
        # Crucial: Update data path and save path based on the dataset name
        args.data_path = f"/scratch/Arya/Processed_{args.dataset_name}/"
        args.save_path = f'/scratch/Arya/{args.dataset_name}_tuned/'
        
        # RESET SEED: Ensures fair comparison (same initialization for every config)
        init_seed(args.seed)

        val_scores = []
        test_results_list = []
        
        try:
            # Run all 6 folds (experiments) for this specific hyperparameter set
            for exp_id in range(1, 7):
                args.exp_id = exp_id
                print(f"--> Fold {exp_id}/6 ... ", end="", flush=True)
                
                # Run the experiment
                val_f1, t_res = run_experiment(args) 
                
                print(f"Done. Val F1: {val_f1:.4f} | Test F1: {t_res['f1']:.4f}")
                
                val_scores.append(val_f1)
                test_results_list.append(t_res)

                # Cleanup GPU memory between folds to prevent OOM
                torch.cuda.empty_cache()
                gc.collect()
            
            # Calculate averages
            avg_val_score = sum(val_scores) / len(val_scores)
            avg_test_f1 = sum(r['f1'] for r in test_results_list) / len(test_results_list)
            
            # Prepare log entry
            log_entry = params.copy()
            log_entry['avg_validation_f1'] = avg_val_score
            log_entry['avg_test_f1'] = avg_test_f1
            
            # Add all other test metrics
            log_entry['avg_test_acc'] = sum(r['acc'] for r in test_results_list) / len(test_results_list)
            log_entry['avg_test_auroc'] = sum(r['auroc'] for r in test_results_list) / len(test_results_list)
            
            results.append(log_entry)
            
            print(f"*** COMBO RESULT: Avg Val F1: {avg_val_score:.4f} ***")

            # Save incrementally to CSV (prevents data loss if crash)
            df = pd.DataFrame(results)
            df.to_csv('tuning_results.csv', index=False)

        except KeyboardInterrupt:
            print("\nInterrupted by user. Saving current progress...")
            df = pd.DataFrame(results)
            df.to_csv('tuning_results_interrupted.csv', index=False)
            sys.exit(0)
            
        except Exception as e:
            print(f"\n!!! Error in combination {params}: {e}")
            # Save what we have so far even if it crashes
            if results:
                df = pd.DataFrame(results)
                df.to_csv('tuning_results_error.csv', index=False)
            continue

    print("\n\n--- Tuning Complete ---")
    if results:
        df = pd.DataFrame(results)
        best_run = df.loc[df['avg_validation_f1'].idxmax()]
        print("Best Run based on Validation F1:")
        print(best_run)
        
        # Save final sorted results
        df.sort_values(by='avg_validation_f1', ascending=False).to_csv('tuning_results_final.csv', index=False)

if __name__ == "__main__":
    run_tuning()