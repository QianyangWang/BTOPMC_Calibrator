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




'''灰狼算法'''


def GWO(pop, dim, lb, ub, MaxIter, fun,valve,n_jobs,args):
   
    Alpha_pos=np.zeros([1,dim])
    Alpha_score = float("inf")
    Beta_pos=np.ones([1,dim])
    Beta_score = float("inf")
    Delta_pos=np.ones([1,dim])
    Delta_score = float("inf")
    
    
    X, lb, ub = initial(pop, dim, ub, lb)  # 初始化种群
    fitness = Caculate_ini_Fitness(X, fun,n_jobs,args)  # 计算适应度值
    indexBest = np.argmin(fitness)
    GbestScore = copy.copy(fitness[indexBest])
    GbestPositon = np.zeros([1,dim])
    GbestPositon[0,:] = copy.copy(X[indexBest,:])
    Curve = np.zeros([MaxIter, 1])

    SettingsIO.save_gbestposition(GbestPositon)
    SettingsIO.save_gbestscore(GbestScore)
    Report.write_report()

    for t in range(MaxIter):
        t1 = time.time()
        """
        for i in range(pop):            
            #fitValue = fun(X[i,:])
            #fitValue = Caculate_ini_Fitness(X[i,:],fun,1,args)
            if fitValue<Alpha_score:
                Alpha_score = copy.copy(fitValue)
                Alpha_pos[0,:] = copy.copy(X[i,:])
            
            if fitValue>Alpha_score and fitValue<Beta_score:
                Beta_score = copy.copy(fitValue)
                Beta_pos[0,:] = copy.copy(X[i,:])
                
            if fitValue>Alpha_score and fitValue>Beta_score and fitValue<Delta_score:
                Delta_score = copy.copy(fitValue)
                Delta_pos[0,:] = copy.copy(X[i,:])
        """
        fitValues = CaculateFitness(X,fun,GbestScore,n_jobs,args)
        for i in range(len(fitValues)):
            if fitValues[i] < Alpha_score:
                Alpha_score = copy.copy(fitValues[i])
                Alpha_pos[0, :] = copy.copy(X[i, :])

            if fitValues[i] > Alpha_score and fitValues[i] < Beta_score:
                Beta_score = copy.copy(fitValues[i])
                Beta_pos[0, :] = copy.copy(X[i, :])

            if fitValues[i] > Alpha_score and fitValues[i] > Beta_score and fitValues[i] < Delta_score:
                Delta_score = copy.copy(fitValues[i])
                Delta_pos[0, :] = copy.copy(X[i, :])

        a = 2 - t*(2/MaxIter)
        for i in range(pop):
            for j in range(dim):
                r1 = random.random()
                r2 = random.random()
                A1= 2*a*r1-a
                C1 = 2*r2
                
                D_alpha=np.abs(C1*Alpha_pos[0,j]-X[i,j])
                X1=Alpha_pos[0,j]-A1*D_alpha
                
                r1 = random.random()
                r2 = random.random()
                A2= 2*a*r1-a
                C2 = 2*r2
                
                D_beta=np.abs(C2*Beta_pos[0,j]-X[i,j])
                X2=Beta_pos[0,j]-A2*D_beta
                
                r1 = random.random()
                r2 = random.random()
                A3= 2*a*r1-a
                C3 = 2*r2
                D_beta=np.abs(C3*Delta_pos[0,j]-X[i,j])
                X3=Delta_pos[0,j]-A3*D_beta
                
                X[i,j] = (X1+X2+X3)/3
                
                  
        X = BorderCheck(X, ub, lb, pop, dim)  # 边界检测
        fitness = CaculateFitness(X, fun,GbestScore,n_jobs,args)  # 计算适应度值
        indexBest = np.argmin(fitness)
        if fitness[indexBest] <= GbestScore:  # 更新全局最优
            GbestScore = copy.copy(fitness[indexBest])
            GbestPositon[0,:] = copy.copy(X[indexBest, :])
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