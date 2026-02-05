from torch.utils.data import Dataset, DataLoader, ConcatDataset
import numpy as np
import torch
import os

class SubDataset(Dataset):
    def __init__(self, filename, args, mode='train'):
        """
        filename: e.g., 'ID03'
        """
        self.args = args
        self.filename = filename

        filename = f"ID{int(filename):02d}"

        if mode == 'train': 
            data_path = os.path.join(args.data_path, filename, "X_train.npy")
            label_path = os.path.join(args.data_path, filename, "y_train.npy")

        else:
            data_path = os.path.join(args.data_path, filename, "X_total.npy")
            label_path = os.path.join(args.data_path, filename, "Y_total.npy")
    
        if not os.path.exists(data_path):
            raise FileNotFoundError(f"Data for {filename} not found at {data_path}")
        

        self.data = np.load(data_path)
        self.labels = np.load(label_path)
        
        self.num_samples = self.data.shape[0]
        self.target_channels = 128


    def _zscore(self, x):
        mean = x.mean(axis=-1, keepdims=True)
        std = x.std(axis=-1, keepdims=True)
        return (x - mean) / (std + 1e-6)

    def __len__(self):
        return self.num_samples

    def __getitem__(self, index):
        x_np = self.data[index].copy()
        y_val = self.labels[index]
        
        x = torch.from_numpy(x_np.astype(np.float32))
        y = torch.tensor(y_val, dtype=torch.long)

        C = x.shape[0]
        if C > self.target_channels:
            x = x[:self.target_channels, :]
        elif C < self.target_channels:
            pad_amt = self.target_channels - C

            x = torch.nn.functional.pad(x, (0, 0, 0, pad_amt))

        return x, y
    

class NewSubDataset(Dataset):
    def __init__(self, args, mode='train', filename=None):
        """
        filename: e.g., 'ID03'
        """
        self.args = args
        self.mode = mode

        if mode == 'train': 
            data_path = os.path.join(args.data_path, "experiments", f"X_train_exp_{args.exp_id}.npy")
            label_path = os.path.join(args.data_path, "experiments",  f"y_train_exp_{args.exp_id}.npy")

        else:
            filename = f"ID{int(filename):02d}"
            data_path = os.path.join(args.data_path, filename, f"X_total.npy")
            label_path = os.path.join(args.data_path, filename, f"Y_total.npy")
    
        if not os.path.exists(data_path):
            raise FileNotFoundError(f"Data not found at {data_path}")
        

        self.data = np.load(data_path)
        self.labels = np.load(label_path)
        
        self.num_samples = self.data.shape[0]
        self.target_channels = 128


    def _zscore(self, x):
        mean = x.mean(axis=-1, keepdims=True)
        std = x.std(axis=-1, keepdims=True)
        return (x - mean) / (std + 1e-6)

    def __len__(self):
        return self.num_samples

    def __getitem__(self, index):
        x_np = self.data[index].copy()
        y_val = self.labels[index]
        
        x = torch.from_numpy(x_np.astype(np.float32))
        y = torch.tensor(y_val, dtype=torch.long)

        C = x.shape[0]
        if C > self.target_channels:
            x = x[:self.target_channels, :]
        elif C < self.target_channels:
            pad_amt = self.target_channels - C

            x = torch.nn.functional.pad(x, (0, 0, 0, pad_amt))

        return x, y
    

class IEEGDataset(object):
    def __init__(self, filenames, args, mode='train'):
        self.filenames = filenames
        self.args = args
        self.mode = mode

    def get_dataloader(self):
        ds = []

        for filename in self.filenames:
            ds.append(SubDataset(filename, args=self.args, mode = self.mode))
        
        final_ds = ConcatDataset(ds)


        if self.mode == "train":
            batch_size = self.args.batch_size
            shuffle = True
        else:
            batch_size = 256
            shuffle = False

        return DataLoader(
            final_ds, 
            batch_size=batch_size, 
            shuffle=shuffle,
            num_workers=0, 
            drop_last=False
        )