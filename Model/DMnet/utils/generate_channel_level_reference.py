import argparse
import pickle
from collections import Counter
import torch
from sklearn.cluster import KMeans
import numpy as np
import os
import torch.nn.functional as F
from tqdm import tqdm
import warnings
warnings.filterwarnings("ignore")

# username = os.getlogin()
# root_origin_data_path = f"/net/inltitan1/scratch/negin/Dataset/MAYO/npy_noC_files/"

root_origin_data_path = f"/scratch/Arya/Processed_MAYO/"


class ChannelLevelReference(object):
    def __init__(self, filename, dataset, segment_length, sum_up_length, k):
        """
        :param filename: subject's id
        :param segment_length: length of per segment
        :param save_path: where to save the channel level reference.
        """
        # 载入病人文件的全部通道
        # self.x = np.load(os.path.join(root_origin_data_path, dataset, f'{filename}_data.npy'))
        self.x = np.load(os.path.join(root_origin_data_path, f'{filename}_data.npy'))
        self.segment_length = segment_length
        self.sum_up_length = sum_up_length
        self.k = k
        self.R_cl = self.init_global_info()

        
        save_path = f'{filename}_R_cl_{segment_length}_{sum_up_length}_{k}.pkl'
        with open(save_path, 'wb') as f:
            pickle.dump(self.R_cl, f)

        # pickle.dump(self.R_cl, open(os.path.join(root_origin_data_path, f'{filename}_R_cl_{segment_length}_{sum_up_length}_{k}.pkl'), 'wb'))

    def init_global_info(self):
        m, n = self.x.shape
        N = n // self.segment_length
        length = N * self.segment_length
        # x_t = torch.from_numpy(self.x[:, :length].reshape(m, -1, self.segment_length))
        x_t = torch.as_tensor(self.x[:, :length].reshape(m, -1, self.segment_length).astype('float'))
        _, P, L = x_t.shape
        xx = torch.log(torch.abs(torch.fft.rfft(x_t, dim=-1)) + 1)
        c_N = xx.shape[-1]
        avai_c_N = c_N // self.sum_up_length * self.sum_up_length
        xx = xx[:, :, :avai_c_N].view(m, P, -1, self.sum_up_length).sum(dim=-1).numpy()

        print(xx.shape)
        

        global_info_left = []
        global_info_right = []
        for c in tqdm(range(m)):
            kmeans = KMeans(n_clusters=self.k)
            kmeans.fit(xx[c])
            labels = kmeans.labels_
            center_ = kmeans.cluster_centers_
            counter = Counter(labels.tolist())
            keys = np.array(list(counter.keys()))[:-1]
            idxs = np.arange(len(labels))
            cur_channel_global_info_left = []
            cur_channel_global_info_right = []
            for key in keys:
                cur_key_idxs = idxs[labels == key]
                vals = xx[c, cur_key_idxs]
                dis = torch.sum(torch.from_numpy((vals - center_[key]) ** 2), dim=-1)
                p = F.softmin(dis, dim=-1).numpy()
                sample_cur_key_idxs_left = np.random.choice(cur_key_idxs, size=100, p=p)
                sample_cur_key_idxs_right = np.random.choice(cur_key_idxs, size=100, p=p)
                sample_cur_key_x_left = xx[c, sample_cur_key_idxs_left]
                sample_cur_key_x_right = xx[c, sample_cur_key_idxs_right]
                sample_cur_key_x_left = np.mean(sample_cur_key_x_left, axis=0)
                sample_cur_key_x_right = np.mean(sample_cur_key_x_right, axis=0)
                cur_channel_global_info_left.append(sample_cur_key_x_left)
                cur_channel_global_info_right.append(sample_cur_key_x_right)
            cur_channel_global_info_left = np.vstack(cur_channel_global_info_left)
            cur_channel_global_info_right.reverse()
            cur_channel_global_info_right = np.vstack(cur_channel_global_info_right)
            global_info_left.append(np.expand_dims(cur_channel_global_info_left, axis=0))
            global_info_right.append(np.expand_dims(cur_channel_global_info_right, axis=0))
        global_info_left = np.concatenate(global_info_left, axis=0)
        global_info_right = np.concatenate(global_info_right, axis=0)
        res = np.concatenate([global_info_left, global_info_right], axis=1)
        return res


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='DM')
    parser.add_argument("--dataset", type=str, default='MAYO')
    parser.add_argument("--segment_length", type=int, default=500)
    parser.add_argument("--sum_up_length", type=int, default=5)
    parser.add_argument("--k", type=int, default=8)
    args = parser.parse_args()
    

    MAYO_patient_ids = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 14, 16, 17, 18, 19, 20, 21, 23]
    FNUSA_patient_ids = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]

    patient_ids = MAYO_patient_ids if args.dataset == 'MAYO' else FNUSA_patient_ids
    for patient_id in patient_ids:
        ChannelLevelReference(filename=str(patient_id), dataset=args.dataset, segment_length=args.segment_length, sum_up_length=args.sum_up_length, k=args.k)
