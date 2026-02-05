import numpy as np


def read_memb(path):
    data = []
    with open(path, "r") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            data.append(line)
    return data

def bin4_to_int(b):
    v = int(b, 2)
    return v - 16 if v >= 8 else v

def int_to_bin4(v):
    return format(v & 0xF, "04b")


weight_bin = read_memb(
    "/home/hdeng/ic/iEEG_Transformer_Project2/RTL/new_MAC_PE/weight.txt"
)

activation_bin = read_memb(
    "/home/hdeng/ic/iEEG_Transformer_Project2/RTL/new_MAC_PE/activation.txt"
)

weight_int = [bin4_to_int(b) for b in weight_bin]
perm = sorted(range(len(weight_int)),
              key=lambda i: abs(weight_int[i]),
              reverse=True) 
weight_sorted = [weight_bin[i] for i in perm]
activation_sorted = [activation_bin[i] for i in perm]

print("num weight     =", len(weight_sorted))
print("num activation =", len(activation_sorted))

with open("/home/hdeng/ic/iEEG_Transformer_Project2/RTL/new_MAC_PE/weight_sorted.txt", "w") as f:
    for w in weight_sorted:
        f.write(w + "\n")

with open("/home/hdeng/ic/iEEG_Transformer_Project2/RTL/new_MAC_PE/activation_sorted.txt", "w") as f:
    for a in activation_sorted:
        f.write(a + "\n")

