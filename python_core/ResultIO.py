import numpy as np


def read_result(f_result,preheating):
    with open(f_result) as f:
        text = f.readlines()
        results = np.genfromtxt(text)
        flow_results = results[1 + preheating:,1]
    return flow_results


def read_obs(f_obs,preheating):
    with open(f_obs) as f:
        text = f.readlines()
        observations = np.genfromtxt(text)
        flow = observations[1 + preheating:,1]
    return flow


