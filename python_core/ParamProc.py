import numpy as np
import AsciiIO
import SettingsIO
import ParamIO
"""
参数顺序：
alpha,m,Sdbar,dl,dt,n0,T0,Srmax
"""

def form_alpha_bounds(basin_id):
    upperbound = float(SettingsIO.read_parm_settings("Single Param Upper Bound","alpha"))
    lowerbound = float(SettingsIO.read_parm_settings("Single Param Lower Bound","alpha"))
    param_upper = np.ones(len(basin_id)) * upperbound
    param_lower = np.ones(len(basin_id)) * lowerbound
    param_upper = param_upper.tolist()
    param_lower = param_lower.tolist()

    return param_upper, param_lower


def form_m_bounds(basin_id):
    upperbound = float(SettingsIO.read_parm_settings("Single Param Upper Bound", "m"))
    lowerbound = float(SettingsIO.read_parm_settings("Single Param Lower Bound", "m"))
    param_upper = np.ones(len(basin_id)) * upperbound
    param_lower = np.ones(len(basin_id)) * lowerbound
    param_upper = param_upper.tolist()
    param_lower = param_lower.tolist()

    return param_upper, param_lower


def form_sdbar_bounds(basin_id):
    upperbound = float(SettingsIO.read_parm_settings("Single Param Upper Bound", "sdbar"))
    lowerbound = float(SettingsIO.read_parm_settings("Single Param Lower Bound", "sdbar"))
    param_upper = np.ones(len(basin_id)) * upperbound
    param_lower = np.ones(len(basin_id)) * lowerbound
    param_upper = param_upper.tolist()
    param_lower = param_lower.tolist()

    return param_upper, param_lower


def form_dl_bounds():
    param_upper = int(SettingsIO.read_parm_settings("Single Param Upper Bound", "dl"))
    param_lower = int(SettingsIO.read_parm_settings("Single Param Lower Bound", "dl"))

    return param_upper, param_lower


def form_dt_bounds():
    param_upper = int(SettingsIO.read_parm_settings("Single Param Upper Bound", "dt"))
    param_lower = int(SettingsIO.read_parm_settings("Single Param Lower Bound", "dt"))

    return param_upper, param_lower


def form_srmax_bounds(f_landuse):
    srm_method = SettingsIO.read_opt_settings()[-1]
    lu_data = AsciiIO.read(f_landuse)[1]
    classes,indexes = ParamIO.read_lu_soil(f_landuse)
    upperbounds = [float(SettingsIO.read_parm_settings("Srmax Upper Bound", i)) for i in classes]
    lowerbounds = [float(SettingsIO.read_parm_settings("Srmax Lower Bound", i)) for i in classes]
    if srm_method == "Grid":
        param_upper = lu_data.copy()
        param_lower = lu_data.copy()
        for i in range(len(classes)):
            index_x = indexes[i][:,0].flatten()
            index_y = indexes[i][:,1].flatten()
            param_upper[index_x,index_y] = np.ones(param_upper[index_x,index_y].shape[0]) * upperbounds[i]
            param_lower[index_x, index_y] = np.ones(param_lower[index_x, index_y].shape[0]) * lowerbounds[i]
        param_upper = param_upper.flatten().tolist()
        param_lower = param_lower.flatten().tolist()
    else:
        param_upper = []
        param_lower = []
        for i in range(len(classes)):
            param_upper.append(upperbounds[i])
            param_lower.append(lowerbounds[i])

    return param_upper, param_lower


def form_n0_bounds(f_n0, basin_id):
    """
    Grid scale n0 boundary generating function.
    :param f_n0:
    :return:
    """
    n0_method = SettingsIO.read_opt_settings()[-3]
    headers, n0_data, no_data_value = AsciiIO.read(f_n0)
    index, n0 = ParamIO.pop_nan(n0_data,no_data_value)
    upperbound = float(SettingsIO.read_parm_settings("Single Param Upper Bound", "n0"))
    lowerbound = float(SettingsIO.read_parm_settings("Single Param Lower Bound", "n0"))
    if n0_method == "Grid":
        param_upper = np.ones(n0.shape[0]) * upperbound
        param_lower = np.ones(n0.shape[0]) * lowerbound
    else:
        param_upper = np.ones(len(basin_id)) * upperbound
        param_lower = np.ones(len(basin_id)) * lowerbound
    param_upper = param_upper.flatten().tolist()
    param_lower = param_lower.flatten().tolist()

    return param_upper, param_lower

#暂时没用
def form_subbasin_n0_bounds(f_n0, f_sub_basin):
    """
    Sub-basin scale n0 boundary generating function.
    :param f_n0:
    :return:
    """
    sub_basin_id, sbu_basin_index = ParamIO.read_sub_basin(f_sub_basin)
    _, sub_basin, ndv = AsciiIO.read(f_sub_basin)
    _,sub_basin = ParamIO.pop_nan(sub_basin,ndv)
    headers, n0_data, no_data_value = AsciiIO.read(f_n0)
    _, n0 = ParamIO.pop_nan(n0_data,no_data_value)
    upperbound = float(SettingsIO.read_parm_settings("Single Param Upper Bound", "n0"))
    lowerbound = float(SettingsIO.read_parm_settings("Single Param Lower Bound", "n0"))
    param_upper = n0.copy()
    param_lower = n0.copy()
    for i in sub_basin_id:
        index_i = np.argwhere(sub_basin == i)
        param_upper[index_i] = upperbound
        param_lower[index_i] = lowerbound

    return param_upper, param_lower


def form_t0_bound(f_soil_type, f_soil_des):
    t0_method = SettingsIO.read_opt_settings()[-2]
    classes,indexes = ParamIO.read_lu_soil(f_soil_type)
    headers,soil_data,no_data_value = AsciiIO.read(f_soil_type)
    clay_upper = float(SettingsIO.read_parm_settings("T0 Upper Bound","clay"))
    sand_upper = float(SettingsIO.read_parm_settings("T0 Upper Bound","sand"))
    silt_upper = float(SettingsIO.read_parm_settings("T0 Upper Bound","silt"))
    clay_lower = float(SettingsIO.read_parm_settings("T0 Lower Bound","clay"))
    sand_lower = float(SettingsIO.read_parm_settings("T0 Lower Bound","sand"))
    silt_lower = float(SettingsIO.read_parm_settings("T0 Lower Bound","silt"))
    if t0_method == "Grid":
        param_upper = soil_data.copy()
        param_lower = soil_data.copy()
        soil_des = ParamIO.read_soil_description(f_soil_des)
        for i in range(len(classes)):
            index_x = indexes[i][:, 0].flatten()
            index_y = indexes[i][:, 1].flatten()
            soil_fraction = soil_des[classes[i]]
            upper_t0 = clay_upper * soil_fraction[0]/100 + sand_upper * soil_fraction[1]/100 + silt_upper * soil_fraction[2]/100
            lower_t0 = clay_lower * soil_fraction[0]/100 + sand_lower * soil_fraction[1]/100 + silt_lower * soil_fraction[2]/100
            param_upper[index_x, index_y] = np.ones(param_upper[index_x, index_y].shape[0]) * upper_t0
            param_lower[index_x, index_y] = np.ones(param_lower[index_x, index_y].shape[0]) * lower_t0
        param_upper = param_upper.flatten().tolist()
        param_lower = param_lower.flatten().tolist()
    elif t0_method == "Particle":
        param_upper = [clay_upper,sand_upper,silt_upper]
        param_lower = [clay_lower,sand_lower,silt_lower]
    else:
        param_upper = []
        param_lower = []
        soil_des = ParamIO.read_soil_description(f_soil_des)
        for i in range(len(classes)):
            soil_fraction = soil_des[classes[i]]
            upper_t0 = clay_upper * soil_fraction[0]/100 + sand_upper * soil_fraction[1]/100 + silt_upper * soil_fraction[2]/100
            lower_t0 = clay_lower * soil_fraction[0]/100 + sand_lower * soil_fraction[1]/100 + silt_lower * soil_fraction[2]/100
            param_upper.append(upper_t0)
            param_lower.append(lower_t0)

    return param_upper, param_lower


"""
参数顺序：
alpha,m,Sdbar,dl,dt,n0,T0,Srmax
"""


def form_overall_bounds(fn0, f_soil_type, f_soil_des, f_land_use,basin_id):
    alpha_upper, alpha_lower = form_alpha_bounds(basin_id)
    m_upper, m_lower = form_m_bounds(basin_id)
    sdbar_upper,sdbar_lower = form_sdbar_bounds(basin_id)
    dl_upper, dl_lower = form_dl_bounds()
    dt_upper, dt_lower = form_dt_bounds()
    n0_upper, n0_lower = form_n0_bounds(fn0, basin_id)
    t0_upper, t0_lower = form_t0_bound(f_soil_type,f_soil_des)
    srm_upper, srm_lower = form_srmax_bounds(f_land_use)
    overall_upper = alpha_upper + m_upper + sdbar_upper + [dl_upper] + [dt_upper] + n0_upper + t0_upper + srm_upper
    overall_lower = alpha_lower + m_lower + sdbar_lower + [dl_lower] + [dt_lower] + n0_lower + t0_lower + srm_lower
    return overall_upper, overall_lower

"""
f_des = r"H:\BTOP_lecture\BTOP\Projects\siduxi\Input\siduxi.spr"
f_soil = r"H:\BTOP_lecture\BTOP\Projects\siduxi\Input\siduxi.fao"
classes, indexes = ParamIO.read_lu_soil(f_soil)
headers, soil_data, no_data_value = AsciiIO.read(f_soil)
soil_des = ParamIO.read_soil_description(f_des)
print(soil_des)
"""