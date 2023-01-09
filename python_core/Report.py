import numpy as np
import SettingsIO
import ParamIO

def write_report():
    """
    参数顺序：
    alpha,m,Sdbar,dl,dt,n0,T0,Srmax
    """
    dit_mth= {"Sub-Basin":"按子流域","Class":"按类别","Grid":"按网格","Particle":"按粒径"}
    GbestPosition = np.load("GbestPosition.npy")

    param_end_pos,n0_index,t0_index,srm_index,basin_id,metric,preheating,switch_multi_stations,\
    switch_multi_weighting,station_codes,weighting_factors = SettingsIO.read_records()
    population, MaxIter, n0_method, t0_method, srm_method = SettingsIO.read_opt_settings()
    dimension = GbestPosition.shape[1]
    print(param_end_pos)
    f_sub_basin, f_soil, f_lu, f_alpha_m, f_sdbar, f_dl_dt, f_n0, f_t0, f_srm, f_model, f_res, f_obs,f_soil_des = SettingsIO.read_f_locations()
    soil_types, _ = ParamIO.read_lu_soil(f_soil)
    lu_types ,_ = ParamIO.read_lu_soil(f_lu)

    GbestPosition = GbestPosition.flatten().tolist()

    alpha = GbestPosition[:param_end_pos[0]]
    m = GbestPosition[param_end_pos[0]:param_end_pos[1]]
    sdbar = GbestPosition[param_end_pos[1]:param_end_pos[2]]
    dl,dt = GbestPosition[param_end_pos[2]:param_end_pos[3]]
    dl,dt = int(dl), int(dt)

    n0 = GbestPosition[param_end_pos[3]:param_end_pos[4]]
    t0 = GbestPosition[param_end_pos[4]:param_end_pos[5]]
    srm = GbestPosition[param_end_pos[5]:param_end_pos[6]]

    with open("optimization_report.rpt","w") as f:
        f.write("##############################智能优化算法输出报告##############################\n")
        f.write("子流域数量：\t\t{}\n".format(len(basin_id)))
        f.write("种群大小：\t\t{}\n".format(population))
        f.write("最大迭代次数：\t\t{}\n".format(MaxIter))
        f.write("alpha率定方法：\t\t按子流域\n")
        f.write("m率定方法：\t\t按子流域\n")
        f.write("sdbar率定方法：\t\t按子流域\n")
        f.write("n0率定方法：\t\t{}\n".format(dit_mth[n0_method]))
        f.write("T0率定方法：\t\t{}\n".format(dit_mth[t0_method]))
        f.write("Srmax率定方法：\t\t{}\n".format(dit_mth[srm_method]))
        f.write("参数维度：\t\t{}\n".format(dimension))
        f.write("##############################     alpha     ################################\n")
        f.write("Basin ID\t\talpha取值\n")
        for i in range(len(basin_id)):
            f.write("{}\t\t{}\n".format(basin_id[i],alpha[i]))
        f.write("##############################       m       ################################\n")
        f.write("Basin ID\t\tm取值\n")
        for i in range(len(basin_id)):
            f.write("{}\t\t{}\n".format(basin_id[i],m[i]))
        f.write("##############################     dl&dt     ###############################\n")
        f.write("dl\t\t{}\n".format(int(dl)))
        f.write("dt\t\t{}\n".format(int(dt)))
        f.write("##############################     sdbar     ###############################\n")
        f.write("Basin ID\t\tsdbar取值\n")
        for i in range(len(basin_id)):
            f.write("{}\t\t{}\n".format(basin_id[i],sdbar[i]))
        f.write("##############################      n0       ################################\n")
        if n0_method == "Sub-Basin":
            f.write("Basin ID\t\tn0取值\n")
            for i in range(len(basin_id)):
                f.write("{}\t\t{}\n".format(basin_id[i], n0[i]))
        elif n0_method == "Grid":
            f.write("用户选择了网格尺度率定，n0参数文件为：{}\n".format(f_n0))
        f.write("##############################      t0       #################################\n")
        if t0_method == "Class":
            f.write("Soil ID\t\tt0取值\n")
            for i in range(len(soil_types)):
                f.write("{}\t\t{}\n".format(soil_types[i], t0[i]))
        elif t0_method == "Grid":
            f.write("用户选择了网格尺度率定，t0参数文件为：{}\n".format(f_t0))
        elif t0_method == "Particle":
            particles = ["Clay","Sand","Silt"]
            for i in range(len(particles)):
                f.write("{}\t\t{}\n".format(particles[i], t0[i]))
        f.write("##############################     srmax      ###############################\n")
        if srm_method == "Class":
            f.write("Landuse ID\t\tsrmax取值\n")
            for i in range(len(lu_types)):
                f.write("{}\t\t{}\n".format(lu_types[i], srm[i]))
        elif srm_method == "Grid":
            f.write("用户选择了网格尺度率定，srmax参数文件为：{}\n".format(f_srm))

