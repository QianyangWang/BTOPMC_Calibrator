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
            X[i, j] = random.random()*(ub[j] - lb[j]) + lb[j]
    X = Load.update_load_pop(X, dim, ub, lb)
    return X,lb,ub
            
'''边界检查函数'''
def BorderCheck(X,ub,lb,pop,dim):
    for i in range(pop):
        for j in range(dim):
            if X[i,j]>ub[j]:
                X[i,j] = ub[j]
            elif X[i,j]<lb[j]:
                X[i,j] = lb[j]
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
    return fitness,index

    

'''根据适应度对位置进行排序'''
def SortPosition(X,index):
    Xnew = np.zeros(X.shape)
    for i in range(X.shape[0]):
        Xnew[i,:] = X[index[i],:]
    return Xnew


'''旗鱼优化算法'''
def SFO(pop,dim,lb,ub,MaxIter,fun,valve,n_jobs,args):
    A = 4
    e = 0.001
    SFpercent = 0.3
    SFNumber = round(pop*SFpercent)
    SNumber = pop - SFNumber
    
    XSF,lb0,ub0 = initial(SFNumber, dim, ub, lb) #sailfish初始化种群
    fitnessSF = Caculate_ini_Fitness(XSF,fun,n_jobs,args) #计算适应度值
    fitnessSF,indexSF = SortFitness(fitnessSF) #对适应度值排序
    XSF = SortPosition(XSF,indexSF) #种群排序
    Xelite = copy.copy(XSF[0,:]) #sailfish 最优值
    
    XS,lb1,ub1 = initial(SNumber, dim, ub, lb) #sailfish初始化种群 
    fitnessS = Caculate_ini_Fitness(XS,fun,n_jobs,args) #计算适应度值
    fitnessS,indexS = SortFitness(fitnessS) #对适应度值排序
    XS = SortPosition(XS,indexS) #种群排序
    Xinjured = copy.copy(XS[0,:]) #sardines 最优值
    GbestPositon = np.zeros([1,dim]) 
    #记录全局最优值
    if fitnessSF[0] < fitnessS[0]:
        GbestScore =  copy.copy(fitnessSF[0])
        GbestPositon[0,:] = copy.copy(XSF[0,:])
    else:
        GbestScore =  copy.copy(fitnessS[0])
        GbestPositon[0,:] =  copy.copy(XS[0,:])
    Curve = np.zeros([MaxIter,1])
    
    XSFnew = np.zeros(XSF.shape)
    XSnew = np.zeros(XS.shape)

    SettingsIO.save_gbestposition(GbestPositon)
    SettingsIO.save_gbestscore(GbestScore)
    Report.write_report()

    for i in range(MaxIter):
        t1 = time.time()
        #更新XSF
        PD = 1 - (XSF.shape[0]/(XSF.shape[0] + XS.shape[0]))
        lamda = 2*random.random()*PD - PD
        for j in range(XSF.shape[0]):
            XSFnew[j,:] = Xelite - lamda*(random.random()*(((Xelite + Xinjured)/2) - XSF[j,:]))
        
        #更新XS
        AP = A*(1 - 2*i*e)
        if AP<0.5:
            alpha = max(round(XS.shape[0]*AP),1)
            beta = max(round(dim*AP),1)
            indexRandom = random.sample(range(XS.shape[0]),alpha)
            for j in range(alpha):
                XSnew[indexRandom[j],0:beta] = random.random()*(Xelite[0:beta] - XS[indexRandom[j],0:beta] + AP) 
        else:
            for j in range(XSnew.shape[0]):
                XSnew[j,:] = random.random()*(Xelite - XS[j,:] + AP)
        
        XSFnew = BorderCheck(XSFnew,ub,lb,XSFnew.shape[0],dim)
        XSnew = BorderCheck(XSnew,ub,lb,XSnew.shape[0],dim)
        fitnessSF = CaculateFitness(XSFnew,fun,GbestScore,n_jobs,args) #计算适应度值
        fitnessS = CaculateFitness(XSnew,fun,GbestScore,n_jobs,args) #计算适应度值
        #跟据适应度替换
        deleteIndex = np.zeros([XSnew.shape[0],1])
        dSize = min(XSFnew.shape[0],XSnew.shape[0])
        for j in range(dSize):
            if fitnessS[j]<fitnessSF[j]:
                XSFnew[j,:] =  copy.copy(XSnew[j,:])
                fitnessSF[j] =  copy.copy(fitnessS[j])
                deleteIndex[j] = 1
        
        #更新移除的sardine位置,利用其他位置代替
        for j in range(XSnew.shape[0]):
            if deleteIndex[j] == 1:
                Temp = random.random()*(ub - lb) + lb
                XSnew[j,:] =  copy.copy(Temp[0,:])
        
        fitnessS = CaculateFitness(XSnew,fun,GbestScore,n_jobs,args) #计算适应度值
        
        fitnessSF,indexSF = SortFitness(fitnessSF) #对适应度值排序
        XSF = SortPosition(XSFnew,indexSF) #种群排序
        fitnessS,indexS = SortFitness(fitnessS) #对适应度值排序
        XS = SortPosition(XSnew,indexS) #种群排序
        
        Xelite =  copy.copy(XSF[0,:]) #sailfish 最优值
        Xinjured =  copy.copy(XS[0,:]) #sardines 最优值
        
        #记录全局最优
        if fitnessSF[0]<fitnessS[0]:
            LocalGBestX =  copy.copy(XSF[0,:])
            LocalGBestF =  copy.copy(fitnessSF[0])
        else:
            LocalGBestX =  copy.copy(XS[0,:])
            LocalGBestF =  copy.copy(fitnessS[0])
        
        if LocalGBestF<GbestScore:
            GbestScore =  copy.copy(LocalGBestF)
            GbestPositon[0,:] =  copy.copy(LocalGBestX)
            #Plot2D.hydrograph(f_obs, f_res)

            SettingsIO.save_gbestposition(GbestPositon)
            SettingsIO.save_gbestscore(GbestScore)
            Report.write_report()
        
        Curve[i] = GbestScore
        t2 = time.time()
        # 追加内容
        # 计算还需多长时间
        pred_time = (t2 - t1) * (MaxIter - i - 1)
        str = timer.pred_remain_time(pred_time)
        SettingsIO.update_time(str)

        if GbestScore > valve:
            SettingsIO.progress_bar_update(100 * (i + 1) / MaxIter)
            Plot2D.plot(Curve)
            stop_sign = SettingsIO.stop()
            if stop_sign == "0":
                continue
            else:
                break
        else:
            break
    return GbestScore,GbestPositon,Curve









