import numpy as np
import SettingsIO
import os

def check_load(dim,ub,lb):
    if SettingsIO.get_if_load() == 1:
        f_GbestPosition = SettingsIO.load_result()
        path,fname = os.path.split(f_GbestPosition)
        name,fmt = fname.split(".")
        if fmt != "npy":
            return 0
        else:
            GbestPosition = np.load(f_GbestPosition)
            if dim != GbestPosition.shape[1]:
                return 0
            for i in range(dim):
                if GbestPosition[0,i] > ub[i] or GbestPosition[0,i] < lb[i]:
                    return 0
            return 1
    else:
        return 0

def update_load_pop(X,dim,ub,lb):
    load = check_load(dim,ub,lb)
    if load == 1:
        f_GbestPosition = SettingsIO.load_result()
        GbestPosition = np.load(f_GbestPosition)
        for j in range(dim):
            X[-1,j] = GbestPosition[0,j]
        print("Load successfully")
    else:
        print("did not load any result")
    return X

