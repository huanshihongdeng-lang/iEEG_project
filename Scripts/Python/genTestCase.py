import numpy as np
import random

random.seed(0)  # 固定种子，方便复现（可删）
weights = [random.randint(-128, 127) for _ in range(64)]
weights_sorted = sorted(weights, key=abs)
for w in weights_sorted:
    print(w)

def to_2comp_8bit(x):
    return format(x & 0xff, '08b')

with open("/home/hdeng/ic/iEEG_Transformer_Project2/RTL/new_MAC_PE/weight_sorted_8b.txt", "w") as f:
    for w in weights_sorted:
        f.write(to_2comp_8bit(w) + "\n")
