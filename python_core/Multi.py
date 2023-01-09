import multiprocessing as mp
import os
import glob
import shutil
import numpy as np
import sys
"""
def func(msg):
    #print(mp.current_process().name)
    #print(type(mp.current_process().name))
    #return mp.current_process().name + '-' + msg
    process_id = mp.current_process().name.split("-")[-1]
    print(process_id)
    return
"""

def do_multi_jobs(func, params, pop, n_process,arg):

    pool = mp.Pool(processes=n_process)  # 创建n个进程

    results = []
    fitnesses = np.zeros([pop, 1])
    for i in range(pop):
        #results.append(pool.apply_async(func, args = (params[i,:],)))
        results.append(pool.apply_async(func, args=(params[i,:],n_process,arg,)))
    pool.close()  # 关闭进程池，表示不能再往进程池中添加进程，需要在join之前调用
    pool.join()  # 等待进程池中的所有进程执行完毕

    f_obss = []
    f_ress = []

    for i in range(len(results)):
        fitness, f_obs, f_res = results[i].get()
        print(f_res)
        fitnesses[i] = fitness
        f_obss.append(f_obs)
        f_ress.append(f_res)

    return fitnesses, f_obss, f_ress


def creat_multi_jobs(n_process,project_path):
    abs_path = os.path.abspath(sys.argv[0])
    pth = os.path.split(abs_path)[0]
    for i in range(1,n_process+1):
        target_path = r"{}\\process{}".format(pth,i)
        if os.path.exists(target_path):
            delfile(target_path)
            #os.mkdir(r"process{}".format(i))
        else:
            os.mkdir(target_path)
        copy_input_file(project_path,target_path)


def delfile(path):
    #   read all the files under the folder
    fileNames = glob.glob(path + r'\*')
    for fileName in fileNames:
        try:
            #           delete file
            os.remove(fileName)
        except:
            try:
                #               delete empty folders
                os.rmdir(fileName)
            except:
                #               Not empty, delete files under folders
                delfile(fileName)
                #               now, folders are empty, delete it
                os.rmdir(fileName)


def copy_input_file(project_path,target_path):
    input_path = project_path + r"\Input"
    fileNames = glob.glob(input_path + r'\*')
    for i in fileNames:
        if os.path.isfile(i):
            shutil.copy(i,target_path)




