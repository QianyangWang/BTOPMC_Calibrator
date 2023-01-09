import configparser
import sys
import os

import numpy as np

import ParamIO


def read_parm_settings(title, key):
    abs_path = os.path.abspath(sys.argv[0])
    pth = os.path.split(abs_path)[0]
    config = configparser.ConfigParser()
    with open("{}\\param_settings.ini".format(pth)) as f:
        config.read_file(f)
        value = config.get("{}".format(title), "{}".format(key))
    return value


def read_system_settings():
    abs_path = os.path.abspath(sys.argv[0])
    pth = os.path.split(abs_path)[0]
    config = configparser.ConfigParser()
    with open("{}\\settings.ini".format(pth)) as f:
        config.read_file(f)
        model_path = config.get("System","Model Location")
        project_path = config.get("System","Project Location")
    return model_path, project_path


def read_opt_settings():
    abs_path = os.path.abspath(sys.argv[0])
    pth = os.path.split(abs_path)[0]
    config = configparser.ConfigParser()
    with open("{}\\settings.ini".format(pth)) as f:
        config.read_file(f)
        population = int(config.get("Method","Population"))
        MaxIter = int(config.get("Method","Max Iteration"))
        n0_method = config.get("Method","n0 Method")
        t0_method = config.get("Method", "T0 Method")
        srm_method = config.get("Method", "Srmax Method")
    return population, MaxIter, n0_method, t0_method, srm_method


def ui_param_setting():
    config = configparser.ConfigParser()
    abs_path = os.path.abspath(sys.argv[0])
    pth = os.path.split(abs_path)[0]
    with open("{}\\param_settings.ini".format(pth)) as f:
        config.read_file(f)
        value = config.get("Srmax Bounds From UI", "bounds")
        values = value.split(" ")
        matrix = [i.split(",") for i in values]
    print(matrix)
    config2 = configparser.ConfigParser()
    config2.read("{}\\param_settings.ini".format(pth))
    for i in matrix:
        config2.set("Srmax Lower Bound","{}".format(i[0]),"{}".format(i[1]))
        config2.set("Srmax Upper Bound", "{}".format(i[0]), "{}".format(i[2]))
    with open("{}\\param_settings.ini".format(pth),"r+") as f:
        config2.write(f)


def progress_bar_update(value):
    abs_path = os.path.abspath(sys.argv[0])
    pth = os.path.split(abs_path)[0]
    config = configparser.ConfigParser()
    config.read("{}\\settings.ini".format(pth))
    config.set("Progress","progress","{}".format(int(value)))
    with open("{}\\settings.ini".format(pth),"r+") as f:
        config.write(f)


def stop():
    abs_path = os.path.abspath(sys.argv[0])
    pth = os.path.split(abs_path)[0]
    config = configparser.ConfigParser()
    with open("{}\\settings.ini".format(pth)) as f:
        config.read_file(f)
        stop_sign = config.get("System","stop sign")
    return stop_sign

def write_stop():
    abs_path = os.path.abspath(sys.argv[0])
    pth = os.path.split(abs_path)[0]
    config = configparser.ConfigParser()
    config.read("{}\\settings.ini".format(pth))
    config.set("System","stop sign", "1")
    with open("{}\\settings.ini".format(pth),"r+") as f:
        config.write(f)

def update_time(str):
    abs_path = os.path.abspath(sys.argv[0])
    pth = os.path.split(abs_path)[0]
    config = configparser.ConfigParser()
    config.read("{}\\settings.ini".format(pth))
    config.set("System","time remain",str)
    with open("{}\\settings.ini".format(pth),"r+") as f:
        config.write(f)

def get_valve_value():
    abs_path = os.path.abspath(sys.argv[0])
    pth = os.path.split(abs_path)[0]
    config = configparser.ConfigParser()
    with open("{}\\settings.ini".format(pth)) as f:
        config.read_file(f)
        value = config.get("Method","stop value")
    value = float(value)
    return value

def get_evaluation_metric():
    abs_path = os.path.abspath(sys.argv[0])
    pth = os.path.split(abs_path)[0]
    config = configparser.ConfigParser()
    with open("{}\\settings.ini".format(pth)) as f:
        config.read_file(f)
        value = config.get("Method","evaluation metric")
    return value

def get_opt_method():
    abs_path = os.path.abspath(sys.argv[0])
    pth = os.path.split(abs_path)[0]
    config = configparser.ConfigParser()
    with open("{}\\settings.ini".format(pth)) as f:
        config.read_file(f)
        value = config.get("System","optimization method")

    return value


def get_multi_processing_setting():
    abs_path = os.path.abspath(sys.argv[0])
    pth = os.path.split(abs_path)[0]
    config = configparser.ConfigParser()
    with open("{}\\settings.ini".format(pth)) as f:
        config.read_file(f)
        value = config.get("System","multi-processing")
    return int(value)


def get_n_jobs_setting():
    abs_path = os.path.abspath(sys.argv[0])
    pth = os.path.split(abs_path)[0]
    config = configparser.ConfigParser()
    with open("{}\\settings.ini".format(pth)) as f:
        config.read_file(f)
        value = config.get("System","n_jobs")
    return int(value)

def get_preheating():
    abs_path = os.path.abspath(sys.argv[0])
    pth = os.path.split(abs_path)[0]
    config = configparser.ConfigParser()
    with open("{}\\settings.ini".format(pth)) as f:
        config.read_file(f)
        value = config.get("Advance","preheating")
    return int(value)

def get_switch_multistations():
    abs_path = os.path.abspath(sys.argv[0])
    pth = os.path.split(abs_path)[0]
    config = configparser.ConfigParser()
    with open("{}\\settings.ini".format(pth)) as f:
        config.read_file(f)
        value = float(config.get("Advance","multistations"))
    return int(value)

def get_switch_weighting():
    abs_path = os.path.abspath(sys.argv[0])
    pth = os.path.split(abs_path)[0]
    config = configparser.ConfigParser()
    with open("{}\\settings.ini".format(pth)) as f:
        config.read_file(f)
        value = float(config.get("Advance","weighting"))
    return int(value)

def get_station_codes():
    abs_path = os.path.abspath(sys.argv[0])
    pth = os.path.split(abs_path)[0]
    config = configparser.ConfigParser()
    with open("{}\\settings.ini".format(pth)) as f:
        config.read_file(f)
        strs = config.get("Advance","stations")
    stations = strs.split(",")
    return stations

def get_weighting_factors():
    abs_path = os.path.abspath(sys.argv[0])
    pth = os.path.split(abs_path)[0]
    config = configparser.ConfigParser()
    with open("{}\\settings.ini".format(pth)) as f:
        config.read_file(f)
        values = config.get("Advance","weighting factors")
    weightings = values.split(",")
    weightings = [float(i) for i in weightings]
    return weightings

def save_f_locations(f_sub_basin,f_soil,f_lu,f_alpha_m,f_sdbar,f_dl_dt,f_n0,f_t0,f_srm,f_model,f_res,f_obs,f_soil_des):
    abs_path = os.path.abspath(sys.argv[0])
    pth = os.path.split(abs_path)[0]
    config = configparser.ConfigParser()
    config.read("{}\\records.ini".format(pth))
    with open("{}\\records.ini".format(pth),"r+") as f:
        config.set("Save Locations", "f_sub_basin", f_sub_basin)
        config.set("Save Locations", "f_soil", f_soil)
        config.set("Save Locations", "f_lu", f_lu)
        config.set("Save Locations", "f_alpha_m", f_alpha_m)
        config.set("Save Locations", "f_sdbar", f_sdbar)
        config.set("Save Locations", "f_dl_dt", f_dl_dt)
        config.set("Save Locations", "f_n0", f_n0)
        config.set("Save Locations", "f_t0", f_t0)
        config.set("Save Locations", "f_srm", f_srm)
        config.set("Save Locations", "f_model", f_model)
        config.set("Save Locations", "f_res", f_res)
        config.set("Save Locations", "f_obs", f_obs)
        config.set("Save Locations", "f_soil_des", f_soil_des)
        config.write(f)


def read_f_locations():
    abs_path = os.path.abspath(sys.argv[0])
    pth = os.path.split(abs_path)[0]
    config = configparser.ConfigParser()
    with open("{}\\records.ini".format(pth)) as f:
        config.read_file(f)
        f_sub_basin = config.get("Save Locations", "f_sub_basin")
        f_soil = config.get("Save Locations", "f_soil")
        f_lu = config.get("Save Locations", "f_lu")
        f_alpha_m = config.get("Save Locations", "f_alpha_m")
        f_sdbar = config.get("Save Locations", "f_sdbar")
        f_dl_dt = config.get("Save Locations", "f_dl_dt")
        f_n0 = config.get("Save Locations", "f_n0")
        f_t0 = config.get("Save Locations", "f_t0")
        f_srm = config.get("Save Locations", "f_srm")
        f_model = config.get("Save Locations", "f_model")
        f_res = config.get("Save Locations", "f_res")
        f_obs = config.get("Save Locations", "f_obs")
        f_soil_des = config.get("Save Locations", "f_soil_des")

    return f_sub_basin,f_soil,f_lu,f_alpha_m,f_sdbar,f_dl_dt,f_n0,f_t0,f_srm,f_model,f_res,f_obs,f_soil_des


def save_records(param_end_pos,n0_index,t0_index,srm_index,basin_id,metric,preheating,switch_multi_stations,switch_multi_weighting,station_codes,weighting_factors):
    param_end_pos = [str(i) for i in param_end_pos]
    basin_id = [str(i) for i in basin_id]
    weighting_factors = [str(i) for i in weighting_factors]
    abs_path = os.path.abspath(sys.argv[0])
    pth = os.path.split(abs_path)[0]
    config = configparser.ConfigParser()
    config.read("{}\\records.ini".format(pth))
    with open("{}\\records.ini".format(pth),"r+") as f:
        config.set("Records", "param_end_pos", ",".join(param_end_pos))

        config.set("Records", "basin_id", ",".join(basin_id))
        config.set("Records", "metric", metric)
        config.set("Records", "preheating", str(preheating))
        config.set("Records", "switch_multi_stations", str(switch_multi_stations))
        config.set("Records", "switch_multi_weighting", str(switch_multi_weighting))
        config.set("Records", "station_codes", ",".join(station_codes))
        config.set("Records", "weighting_factors", ",".join(weighting_factors))
        config.write(f)
    np.save("n0_index.npy",n0_index)
    np.save("t0_index.npy",t0_index)
    np.save("srm_index.npy",srm_index)

def read_records():
    abs_path = os.path.abspath(sys.argv[0])
    pth = os.path.split(abs_path)[0]
    config = configparser.ConfigParser()
    with open("{}\\records.ini".format(pth)) as f:
        config.read_file(f)

        end_pos = config.get("Records", "param_end_pos")
        param_end_pos = end_pos.split(",")
        param_end_pos = [int(i) for i in param_end_pos]

        basins = config.get("Records", "basin_id")
        basin_id = basins.split(",")
        basin_id = [int(float(i)) for i in basin_id]

        metric = config.get("Records", "metric")
        preheating = int(config.get("Records", "preheating"))
        switch_multi_stations = int(config.get("Records", "switch_multi_stations"))
        switch_multi_weighting = int(config.get("Records", "switch_multi_weighting"))

        stations = config.get("Records", "station_codes")
        station_codes = stations.split(",")

        weightings = config.get("Records", "weighting_factors")
        weighting_factors = weightings.split(",")
        weighting_factors = [float(i) for i in weighting_factors]
    n0_index = np.load("n0_index.npy")
    t0_index = np.load("t0_index.npy")
    srm_index = np.load("srm_index.npy")
    return param_end_pos,n0_index,t0_index,srm_index,basin_id,metric,preheating,switch_multi_stations,switch_multi_weighting,station_codes,weighting_factors

def save_gbestscore(GbestScore):
    abs_path = os.path.abspath(sys.argv[0])
    pth = os.path.split(abs_path)[0]
    config = configparser.ConfigParser()
    config.read("{}\\records.ini".format(pth))
    with open("{}\\records.ini".format(pth), "r+") as f:
        config.set("Performance", "gbestscore", str(GbestScore[0]))
        config.write(f)


def save_gbestposition(GbestPosition):
    np.save("GbestPosition.npy",GbestPosition)
    f_sub_basin, f_soil, f_lu, f_alpha_m, f_sdbar, f_dl_dt, f_n0, f_t0, f_srm, f_model, f_res, f_obs,f_soil_des = read_f_locations()
    param_end_pos,n0_index,t0_index,srm_index,basin_id,metric,preheating,\
    switch_multi_stations,switch_multi_weighting,station_codes,weighting_factors = read_records()
    ParamIO.write_params(GbestPosition.flatten().tolist(),param_end_pos,n0_index, t0_index, srm_index,
                 f_alpha_m, f_sdbar, f_dl_dt, f_n0, f_t0, f_srm,
                 basin_id, f_sub_basin, f_soil, f_lu,f_soil_des)


def get_if_load():
    abs_path = os.path.abspath(sys.argv[0])
    pth = os.path.split(abs_path)[0]
    config = configparser.ConfigParser()
    with open("{}\\settings.ini".format(pth)) as f:
        config.read_file(f)
        value = float(config.get("Advance","load result"))
    return int(value)

def load_result():
    abs_path = os.path.abspath(sys.argv[0])
    pth = os.path.split(abs_path)[0]
    config = configparser.ConfigParser()
    with open("{}\\settings.ini".format(pth)) as f:
        config.read_file(f)
        f_GbestPosition = config.get("Advance","gbestposition")
    return f_GbestPosition
"""
multi = get_multi_processing_setting()
nj = get_n_jobs_setting()
print(multi,nj)
"""
