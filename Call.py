import win32api
import win32event
import win32process
import win32con
import os

from win32com.shell.shell import ShellExecuteEx
from win32com.shell import shellcon

def callexe(f_model,f_cnd):
    abspath = os.getcwd()
    prjpath = os.path.join(abspath, str(f_cnd))
    model_path, model_exe = os.path.split(f_model)
    model_preprosessing = model_path + "\\y_param2.exe"
    prj_folder = prjpath.split(".")[0]

    #param = str(prjpath) + r"      -guicmd    rebuild -compileroption  release -exit"
    param0 = str(prj_folder)
    param = str(prjpath)
    # win32api.ShellExecute(0,"open",exePath,param,'',1)

    process_info0 = ShellExecuteEx(nShow=win32con.SW_HIDE,
                                  fMask=shellcon.SEE_MASK_NOCLOSEPROCESS,
                                  lpVerb='runas',
                                  lpFile=model_preprosessing,
                                  lpParameters=param0)
    win32event.WaitForSingleObject(process_info0['hProcess'], -1)
    ret0 =  win32process.GetExitCodeProcess(process_info0['hProcess'])
    print(ret0)

    process_info = ShellExecuteEx(nShow=win32con.SW_HIDE,
                                  fMask=shellcon.SEE_MASK_NOCLOSEPROCESS,
                                  lpVerb='runas',
                                  lpFile=f_model,
                                  lpParameters=param)
    win32event.WaitForSingleObject(process_info['hProcess'], -1)
    
    ret = win32process.GetExitCodeProcess(process_info['hProcess'])
    #print(ret)
    #print(type(ret))
    win32api.CloseHandle(process_info['hProcess'])

    #handle = win32process.CreateProcess(f_model, param, None, None, 0, win32process.CREATE_NO_WINDOW, None, None, win32process.STARTUPINFO())

    #win32event.WaitForSingleObject(handle[0], -1)
    return ret0,ret

"""
if __name__ == "__main__":
    ret = callexe(r"H:\BTOP_lecture\BTOP\Programs\YHyM132.exe",r"D:\BtopmcCalibratorMulti\process1\siduxi.cnd")
    print(ret)
"""
