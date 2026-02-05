

import numpy as np


from sklearn.metrics import roc_auc_score, average_precision_score
class Metrics:
    def __init__(self, pred, true, use_prob=False):
        pred, true = np.array(pred), np.array(true)
        if use_prob:
            threshold = 0.5
            pred = (pred >= threshold)



        # print ratio of positives samples to lal
        
        # print("Positive ratio in true labels: ", np.sum(true) / len(true))
        
        if np.sum(true) == 0 and np.sum(pred) == 0:
            self.special_good = True
        else:
            self.special_good = False

        self.tn = np.sum((pred == 0) & (true == 0))
        self.tp = np.sum((pred == 1) & (true == 1))
        self.fn = np.sum((pred == 0) & (true == 1))
        self.fp = np.sum((pred == 1) & (true == 0))
        self.acc = np.sum(pred == true) / len(true)

        self.sensitivity = self.tp / (self.tp + self.fn) if (self.tp + self.fn) > 0 else 0
        self.specificity = self.tn / (self.tn + self.fp) if (self.tn + self.fp) > 0 else 0


        self.auroc = roc_auc_score(true, pred)




        self.prec = self.tp / (self.tp + self.fp)
        self.rec = self.tp / (self.tp + self.fn)
        if self.prec == 0 and self.rec == 0:
            self.f_half = 0
            self.f_one = 0
            self.f_doub = 0
        else:
            self.f_half = self.fbeta(self.prec, self.rec, beta=0.5)
            self.f_one = self.fbeta(self.prec, self.rec, beta=1)
            self.f_doub = self.fbeta(self.prec, self.rec, beta=2)

    def get_confusion(self):
        return f"TP={self.tp}, TN={self.tn}, FP={self.fp}, FN={self.fn} " if not self.special_good else "special_good"

    def __str__(self):
        out = ''
        out += '-' * 15 + 'Metrics' + '-' * 15 + '\n'
        out += 'Accuracy:  ' + str(self.acc) + '\n'
        out += 'Precision: ' + str(self.prec) + '\n'
        out += 'Recall:    ' + str(self.rec) + '\n'
        out += 'F0.5:      ' + str(self.f_half) + '\n'
        out += 'F1:        ' + str(self.f_one) + '\n'
        out += 'F2:        ' + str(self.f_doub) + '\n'
        out += 'Specificity: ' + str(self.specificity) + '\n'
        out += 'Sensitivity: ' + str(self.sensitivity) + '\n'
        out += "AUROC:      " + str(self.auroc) + '\n'
        return out

    @staticmethod
    def fbeta(precision, recall, beta):
        return (1 + beta ** 2) * (precision * recall) / ((beta ** 2 * precision) + recall)




