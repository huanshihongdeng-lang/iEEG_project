from exp_settings import ExpSettings_MAYO, ExpSettings_FNUSA


from torch.utils.data import Dataset, DataLoader, ConcatDataset
import numpy as np
import torch
import os
import pickle

from image_creation import *



import numpy as np


def bin_signal(x, bin_size=10):
    # x shape: (7500,)
    return x.reshape(-1, bin_size).sum(axis=1)




class SubDataset(Dataset):
    def __init__(self, filename, args):
        self.args = args
        self.filename = filename
        self.x = np.load(f'{args.data_path}/{filename}_data.npy')

        self.y = np.load(f'{args.data_path}/{filename}_label.npy')

        print(self.x.shape, self.y.shape)
        self.segment_num = args.segment_num
        self.segment_length = args.segment_length
        self.length = (2*self.segment_num + 1) * self.segment_length


        self.half_context_length = self.segment_num * self.segment_length    

        if args.is_channel_level:
            pickle_path = f'{filename}_R_cl_{args.segment_length}_{args.sum_up_length}_{args.k}.pkl'
            with open(pickle_path, 'rb') as f:
                self.R_cl = torch.from_numpy(pickle.load(f))
        else:
            self.R_cl = 5


    def __getitem__(self, index):
        s = index*self.length

        e = (index+1)*self.length
        data = self.x[:, s:e]

        
        center_label = np.sum(self.y[:, s:e], axis=1)

        center_label[center_label > 0] = 1

        x = torch.from_numpy(data).float()
        y = torch.from_numpy(np.array(center_label)).long()


        return x, y, self.R_cl

    def __len__(self):
        return self.x.shape[-1] // self.length
        # return self.x.shape[0]

    def get_dataloader(self):
        return DataLoader(self, batch_size=self.args.batch_size, shuffle=True, drop_last=False)
    



class IEEGDataset(object):
    def __init__(self, filenames, args):
        self.filenames = filenames
        self.args = args

    def get_dataloader(self):
        ds = []
        for filename in self.filenames:
            ds.append(SubDataset(filename, args=self.args))

        ds = ConcatDataset(ds)

        return DataLoader(ds, batch_size=self.args.batch_size, shuffle=True, drop_last=False)


if __name__ == '__main__':
    ...


