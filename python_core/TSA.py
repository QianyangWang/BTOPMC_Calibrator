import numpy as np
import random
import copy
import SettingsIO
import Plot2D
import time
import timer
import Multi
import Load
import Report

''' 种群初始化函数 '''
def initial(pop, dim, ub, lb):
    X = np.zeros([pop, dim])
    for i in range(pop):
        for j in range(dim):
            X[i, j] = random.random() * (ub[j] - lb[j]) + lb[j]
    X = Load.update_load_pop(X, dim, ub, lb)
    return X, lb, ub


'''边界检查函数'''


def BorderCheck(X, ub, lb, pop, dim):
    for i in range(pop):
        for j in range(dim):
            if X[i, j] > ub[j]:
                X[i, j] = ub[j]
            elif X[i, j] < lb[j]:
                X[i, j] = lb[j]
    return X


'''计算适应度函数'''
def Caculate_ini_Fitness(X,fun,n_jobs,args):
    pop = X.shape[0]
    #fitness = np.zeros([pop, 1])
    """
    for i in range(pop):
        fitness[i] = fun(X[i, :])[0]
    """
    fitness, f_obss, f_ress = Multi.do_multi_jobs(func=fun,params=X,pop=pop,n_process=n_jobs,arg=args)
    preheating = args[-5]
    Plot2D.hydrograph(f_obss[0], f_ress[0], preheating)
    return fitness

def CaculateFitness(X,fun,GbestScore,n_jobs,args):
    pop = X.shape[0]
    #fitness = np.zeros([pop, 1])
    """
    for i in range(pop):
        fitness[i], f_obs, f_res = fun(X[i, :])
        if fitness[i] < GbestScore:
            time.sleep(0.5)
            Plot2D.hydrograph(f_obs,f_res)
            print(fitness[i])
            time.sleep(0.5)
        else:
            continue
    """
    fitness, f_obss, f_ress = Multi.do_multi_jobs(func=fun, params=X, pop=pop, n_process=n_jobs,arg=args)

    for i in range(len(f_obss)):
        if fitness[i] < GbestScore and fitness[i] == np.min(fitness):
            preheating = args[-5]
            Plot2D.hydrograph(f_obss[i], f_ress[i],preheating)
            print(fitness[i])
    return fitness


'''适应度排序'''


def SortFitness(Fit):
    fitness = np.sort(Fit, axis=0)
    index = np.argsort(Fit, axis=0)
    return fitness, index


'''根据适应度对位置进行排序'''


def SortPosition(X, index):
    Xnew = np.zeros(X.shape)
    for i in range(X.shape[0]):
        Xnew[i, :] = X[index[i], :]
    return Xnew


'''被囊群算法'''


def TSA(pop, dim, lb, ub, MaxIter, fun,valve,n_jobs,args):
    X, lb, ub = initial(pop, dim, ub, lb)  # 初始化种群
    fitness = Caculate_ini_Fitness(X, fun,n_jobs,args)  # 计算适应度值
    fitness, sortIndex = SortFitness(fitness)  # 对适应度值排序
    X = SortPosition(X, sortIndex)  # 种群排序
    GbestScore = copy.copy(fitness[0])
    GbestPositon = np.zeros([1,dim])
    GbestPositon[0,:] = copy.copy(X[0,:])
    Curve = np.zeros([MaxIter, 1])
    Pos = np.zeros([pop,dim])

    SettingsIO.save_gbestposition(GbestPositon)
    SettingsIO.save_gbestscore(GbestScore)
    Report.write_report()

    for t in range(MaxIter):
        t1 = time.time()
        xmin = 1
        xmax = 4
        xr = xmin + random.random()*(xmax-xmin)
        xr = np.fix(xr)
      
        for i in range(pop):
            for j in range(dim):
                A1 = (random.random() + random.random()) - (2*random.random())/xr
                c2 = random.random()
                if i==0:
                    c3 = random.random()
                    d_pos = np.abs(GbestPositon[0,j] - c2*X[i,j])
                    if c3>=0.5:
                        Pos[i,j] = GbestPositon[0,j] + A1*d_pos
                    else:
                        Pos[i,j] = GbestPositon[0,j] - A1*d_pos
                else:
                    c3 = random.random()
                    d_pos = np.abs(GbestPositon[0,j] - c2*X[i,j])
                    if c3>=0.5:
                        Pos[i,j] = GbestPositon[0,j] + A1*d_pos
                    else:
                        Pos[i,j] = GbestPositon[0,j] - A1*d_pos
                    X[i,j] = (Pos[i,j] + X[i,j])/(2 + random.random())

              
        X = BorderCheck(X, ub, lb, pop, dim)  # 边界检测
        fitness = CaculateFitness(X, fun,GbestScore,n_jobs,args)  # 计算适应度值
        fitness, sortIndex = SortFitness(fitness)  # 对适应度值排序
        X = SortPosition(X, sortIndex)  # 种群排序
        if fitness[0] <= GbestScore:  # 更新全局最优
            GbestScore = copy.copy(fitness[0])
            GbestPositon[0,:] = copy.copy(X[0, :])
            #Plot2D.hydrograph(f_obs, f_res)

            SettingsIO.save_gbestposition(GbestPositon)
            SettingsIO.save_gbestscore(GbestScore)
            Report.write_report()

        Curve[t] = GbestScore
        t2 = time.time()
        # 追加内容
        # 计算还需多长时间
        pred_time = (t2 - t1) * (MaxIter - t - 1)
        str = timer.pred_remain_time(pred_time)
        SettingsIO.update_time(str)

        if GbestScore > valve:
            SettingsIO.progress_bar_update(100 * (t + 1) / MaxIter)
            Plot2D.plot(Curve)
            stop_sign = SettingsIO.stop()
            if stop_sign == "0":
                continue
            else:
                break
        else:
            break

    return GbestScore, GbestPositon, Curve