import numpy as np


def NSE(real_data,pred_data):

    mean_obs = np.mean(real_data)
    upper = []
    lower = []
    for i in range(len(real_data)):
        upper.append((real_data[i]-pred_data[i])**2)
        lower.append((real_data[i]-mean_obs)**2)
    _upper = sum(upper)
    _lower = sum(lower)
    NSE = 1-(_upper/_lower)
    return 1 - NSE


def MAE(real_data,pred_data):
    errors = []
    m= len(real_data)
    for i in range(m):
        errors.append(abs(real_data[i]-pred_data[i]))
    error = sum(errors)
    mae = error/m
    return mae


def MSE(real_data,pred_data):
    errors = []
    m= len(real_data)
    for i in range(m):
        errors.append((real_data[i]-pred_data[i])**2)
    error = sum(errors)
    mse = error/m
    return mse

