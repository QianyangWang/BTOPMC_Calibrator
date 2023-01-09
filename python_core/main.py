import time
import numpy as np
import Initialize
import Multi
import SettingsIO
import ParamIO
import ParamProc
import EvaluationMetrics
import ResultIO
import Call
import Plot2D
import SSA
import SFO
import GWO
import WOA
import TSA
import SOA
import multiprocessing as mp
import os
import sys
from multiprocessing import freeze_support
import Report

def objective_equation(params,n_jobs,args):
    """
    :param params: parameters of the target function in an array.
    :return: prediction results in an array.
    """
    """
    global param_sequence,param_end_pos,n0_index,t0_index,srm_index,basin_id, f_sub_basin, f_soil, f_lu
    global f_alpha_m, f_sdbar, f_dl_dt, f_n0, f_t0, f_srm
    global f_model, f_res, f_obs
    global metric
    """
    param_sequence, param_end_pos, n0_index, t0_index, srm_index, basin_id,\
    f_sub_basin, f_soil, f_lu,f_alpha_m, f_sdbar, f_dl_dt, f_n0, f_t0, f_srm,\
    f_model, f_res, f_obs, f_soil_des,metric,preheating,switch_multi_stations,switch_weighting,\
    station_codes,weighting_factors = args

    abs_path = os.path.abspath(sys.argv[0])

    #print(mp.current_process().name)
    process_id = mp.current_process().name.split("-")[-1]
    #根据进程号分配文件夹编号
    folder_id = int(process_id) % n_jobs + 1

    process_folder = os.path.split(abs_path)[0] + r"\\process{}\\".format(folder_id)
    #print(process_folder)

    this_f_sub_basin = process_folder + os.path.split(f_sub_basin)[1]
    this_f_soil = process_folder + os.path.split(f_soil)[1]
    this_f_lu = process_folder + os.path.split(f_lu)[1]
    this_f_alpha_m = process_folder + os.path.split(f_alpha_m)[1]
    this_f_sdbar = process_folder + os.path.split(f_sdbar)[1]
    this_f_dl_dt = process_folder + os.path.split(f_dl_dt)[1]
    this_f_n0 = process_folder + os.path.split(f_n0)[1]
    this_f_t0 = process_folder + os.path.split(f_t0)[1]
    this_f_srm = process_folder + os.path.split(f_srm)[1]
    this_f_res = process_folder + os.path.split(f_res)[1]
    this_f_obs = process_folder + os.path.split(f_obs)[1]
    this_f_soil_des = process_folder + os.path.split(f_soil_des)[1]


    params = params.flatten().tolist()
    ParamIO.write_params(params,param_end_pos,n0_index,t0_index,srm_index,this_f_alpha_m,
                         this_f_sdbar, this_f_dl_dt, this_f_n0, this_f_t0, this_f_srm,basin_id,
                         this_f_sub_basin, this_f_soil, this_f_lu,this_f_soil_des)


    abs_dir = os.path.split(abs_path)[0] + r'\\process{}\\'.format(folder_id)

    ParamIO.change_cnd_path(this_f_dl_dt,abs_dir)

    ret0,ret = Call.callexe(f_model,this_f_dl_dt)

    # error code 1
    if ret == 1 or ret0 !=0:
        fitness = 999999
    else:
        if switch_multi_stations == 0:
            pred_res = ResultIO.read_result(this_f_res,preheating)
            obs_res = ResultIO.read_obs(this_f_obs,preheating)
            fitness = eval("EvaluationMetrics.{}".format(metric))(obs_res,pred_res)
        else:
            stations_metrics = []
            for i in station_codes:
                this_f_res = process_folder + "outqobs{}.rst".format(i)
                this_f_obs = process_folder + "qobs{}.obs".format(i)
                pred_res = ResultIO.read_result(this_f_res,preheating)
                obs_res = ResultIO.read_obs(this_f_obs, preheating)
                single_fitness = eval("EvaluationMetrics.{}".format(metric))(obs_res, pred_res)
                stations_metrics.append(single_fitness)
            if switch_weighting == 0:
                fitness = sum(stations_metrics)/len(stations_metrics)
            else:
                fitness = 0
                for i in range(len(stations_metrics)):
                    fitness += stations_metrics[i] * weighting_factors[i]

    return fitness,this_f_obs,this_f_res


def main():

    f_dict = Initialize.initialize()
    """
    global f_alpha_m, f_sdbar, f_dl_dt, f_n0, f_t0, f_srm, f_model, f_sub_basin, f_soil, f_lu
    global f_res, f_obs
    global metric
    """
    metric = SettingsIO.get_evaluation_metric()
    opt_method = SettingsIO.get_opt_method()
    opt_module_method = "{}.{}".format(opt_method,opt_method)

    f_alpha_m = f_dict["f_alpha_m"]
    f_sdbar = f_dict["f_sdbar"]
    f_dl_dt = f_dict["f_dl_dt"]
    f_n0 = f_dict["f_n0"]
    f_t0 = f_dict["f_t0"]
    f_srm = f_dict["f_srm"]
    f_sub_basin = f_dict["f_sub_basin"]
    f_model = f_dict["model_path"]
    f_soil = f_dict["f_soil_type"]
    f_lu = f_dict["f_lu"]
    f_soil_des = f_dict["f_soil_des"]

    f_res = f_dict["project_path"] + r"\Input\outqobs00.rst"
    f_obs = f_dict["project_path"] + r"\Input\qobs00.obs"

    #global param_sequence, param_sequence, param_end_pos, n0_index, t0_index, srm_index, basin_id
    param_sequence, param_end_pos,\
    n0_index, t0_index, srm_index,\
    basin_id = ParamIO.form_param_sequence(f_alpha_m, f_sdbar, f_dl_dt, f_n0, f_t0, f_srm, f_soil, f_lu)

    population, MaxIter, _, _, _ = SettingsIO.read_opt_settings()
    upperbound, lowerbound = ParamProc.form_overall_bounds(f_n0,f_dict["f_soil_type"], f_dict["f_soil_des"],
                                                           f_dict["f_lu"],basin_id)

    # read the multi-processing setting
    multi = SettingsIO.get_multi_processing_setting()
    n_jobs = SettingsIO.get_n_jobs_setting()
    if multi == 0:
        n_jobs = 1

    Multi.creat_multi_jobs(n_process=n_jobs,project_path=f_dict["project_path"])

    dim = len(upperbound)

    upperbound = np.array(upperbound).reshape(-1,1)
    lowerbound = np.array(lowerbound).reshape(-1,1)
    fobj = objective_equation

    valve = SettingsIO.get_valve_value()

    preheating = SettingsIO.get_preheating()
    switch_multi_stations = SettingsIO.get_switch_multistations()
    switch_weighting = SettingsIO.get_switch_weighting()
    station_codes = SettingsIO.get_station_codes()
    weighting_factors = SettingsIO.get_weighting_factors()

    args = (param_sequence, param_end_pos, n0_index, t0_index, srm_index, basin_id,
    f_sub_basin, f_soil, f_lu, f_alpha_m, f_sdbar, f_dl_dt, f_n0, f_t0, f_srm,
    f_model, f_res, f_obs, f_soil_des,metric,preheating,switch_multi_stations,switch_weighting,
            station_codes,weighting_factors)

    #save records
    SettingsIO.save_f_locations(f_sub_basin,f_soil,f_lu,f_alpha_m,f_sdbar,f_dl_dt,f_n0,f_t0,f_srm,f_model,f_res,f_obs,f_soil_des)
    SettingsIO.save_records(param_end_pos,n0_index,t0_index,srm_index,basin_id,metric,preheating,switch_multi_stations,switch_weighting,
                            station_codes,weighting_factors)

    GbestScore, GbestPositon, Curve = eval(opt_module_method)(population, dim, lowerbound, upperbound, MaxIter,
                                              fobj,valve,n_jobs,args)


    GbestPositon = GbestPositon.flatten().tolist()

    ParamIO.write_params(GbestPositon,param_end_pos,n0_index,t0_index,srm_index,f_alpha_m, f_sdbar,
                         f_dl_dt, f_n0, f_t0, f_srm,basin_id,f_sub_basin, f_soil, f_lu,f_soil_des)
    Call.callexe(f_model,f_dl_dt)
    time.sleep(0.1)
    Plot2D.hydrograph(f_obs,f_res,preheating)
    SettingsIO.progress_bar_update(100)
    SettingsIO.write_stop()
    Report.write_report()


if __name__ == "__main__":
    freeze_support()
    main()

