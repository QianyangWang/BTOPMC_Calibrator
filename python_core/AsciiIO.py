import numpy as np


def read(path):
    with open(path) as f:
        text = f.readlines()
        headers, data = "".join(text[0:6]), text[6:]
        header2arr = np.genfromtxt(text[0:6], dtype="double")
        no_data_value = header2arr[-1,1]
        data = np.genfromtxt(data, dtype="double")
    return headers, data, no_data_value


def write(path,headers,data):
    np.savetxt(fname=path, X=data, header=headers,
               delimiter="\t",fmt="%.9f",comments="")

