import SettingsIO
import os

def initialize():
    model_path, project_path = SettingsIO.read_system_settings()
    project_name = os.path.basename(project_path)
    f_alpha_m = "{}\Input\{}.bp".format(project_path,project_name)
    f_Sdbar = "{}\Input\{}.sdbar".format(project_path,project_name)
    f_dl_dt = "{}\Input\{}.cnd".format(project_path,project_name)
    f_n0 = "{}\Input\{}.n0".format(project_path,project_name)
    f_T0 = "{}\Input\{}.t0".format(project_path,project_name)
    f_Srmax = "{}\Input\{}.srm".format(project_path,project_name)
    f_lu = "{}\Input\{}.lc".format(project_path,project_name)
    f_soil_type = "{}\Input\{}.fao".format(project_path,project_name)
    f_soil_des = "{}\Input\{}.spr".format(project_path,project_name)
    f_sub_basin =  "{}\Input\{}.bk".format(project_path,project_name)
    dict = {"project_path":project_path,"model_path":model_path,"f_alpha_m":f_alpha_m,"f_sdbar":f_Sdbar,"f_dl_dt":f_dl_dt,
            "f_n0":f_n0,"f_t0":f_T0,"f_srm":f_Srmax,"f_lu":f_lu,"f_soil_type":f_soil_type,
            "f_soil_des":f_soil_des, "f_sub_basin":f_sub_basin}

    SettingsIO.ui_param_setting()


    SettingsIO.progress_bar_update(0)

    return dict




