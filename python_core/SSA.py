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
    X = Load.update_load_pop(X,dim,ub,lb)

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

'''麻雀发现者更新'''
def PDUpdate(X,PDNumber,ST,Max_iter,dim):
    X_new  = copy.copy(X)
    R2 = random.random()
    for j in range(PDNumber):
        if R2<ST:
            X_new[j,:] = X[j,:]*np.exp(-j/(random.random()*Max_iter))
        else:
            X_new[j,:] = X[j,:] + np.random.randn()*np.ones([1,dim])
    return X_new
        
'''麻雀加入者更新'''            
def JDUpdate(X,PDNumber,pop,dim):
    X_new = copy.copy(X)
    for j in range(PDNumber+1,pop):
         if j>(pop - PDNumber)/2 + PDNumber:
             X_new[j,:]= np.random.randn()*np.exp((X[-1,:] - X[j,:])/j**2)
         else:
             #产生-1，1的随机数
             A = np.ones([dim,1])
             for a in range(dim):
                 if(random.random()>0.5):
                     A[a]=-1       
         AA = np.dot(A,np.linalg.inv(np.dot(A.T,A)))
         X_new[j,:]= X[1,:] + np.abs(X[j,:] - X[1,:])*AA.T
           
    return X_new                    
            
'''危险更新'''   
def SDUpdate(X,pop,SDNumber,fitness,BestF):
    X_new = copy.copy(X)
    Temp = range(pop)
    RandIndex = random.sample(Temp, pop)
    SDchooseIndex = RandIndex[0:SDNumber]
    for j in range(SDNumber):
        if fitness[SDchooseIndex[j]]>BestF:
            X_new[SDchooseIndex[j],:] = X[0,:] + np.random.randn()*np.abs(X[SDchooseIndex[j],:] - X[1,:])
        elif fitness[SDchooseIndex[j]] == BestF:
            K = 2*random.random() - 1
            X_new[SDchooseIndex[j],:] = X[SDchooseIndex[j],:] + K*(np.abs( X[SDchooseIndex[j],:] - X[-1,:])/(fitness[SDchooseIndex[j]] - fitness[-1] + 10E-8))
    return X_new
              
    

'''麻雀搜索算法'''
def SSA(pop,dim,lb,ub,Max_iter,fun,valve,n_jobs,args):

    ST = 0.6 #预警值
    PD = 0.7 #发现者的比列，剩下的是加入者
    SD = 0.2 #意识到有危险麻雀的比重
    PDNumber = int(pop*PD) #发现者数量
    SDNumber = int(pop*SD) #意识到有危险麻雀数量
    X,lb,ub = initial(pop, dim, ub, lb) #初始化种群
    fitness = Caculate_ini_Fitness(X,fun,n_jobs,args) #计算适应度值

    fitness,sortIndex = SortFitness(fitness) #对适应度值排序
    X = SortPosition(X,sortIndex) #种群排序
    GbestScore = copy.copy(fitness[0])
    GbestPositon = np.zeros([1,dim])
    GbestPositon[0,:] = copy.copy(X[0,:])
    Curve = np.zeros([Max_iter,1])

    SettingsIO.save_gbestposition(GbestPositon)
    SettingsIO.save_gbestscore(GbestScore)
    Report.write_report()


    for i in range(Max_iter):
        print(i)
        t1 = time.time()
        
        BestF = fitness[0]
        
        X = PDUpdate(X,PDNumber,ST,Max_iter,dim)#发现者更新
        
        X = JDUpdate(X,PDNumber,pop,dim) #加入者更新
        
        X = SDUpdate(X,pop,SDNumber,fitness,BestF) #危险更新
        
        X = BorderCheck(X,ub,lb,pop,dim) #边界检测
        
        fitness = CaculateFitness(X,fun,GbestScore,n_jobs,args) #计算适应度值
        fitness,sortIndex = SortFitness(fitness) #对适应度值排序

        X = SortPosition(X,sortIndex) #种群排序
        if(fitness[0]<=GbestScore): #更新全局最优
            GbestScore = copy.copy(fitness[0])
            GbestPositon[0,:] = copy.copy(X[0,:])
            #Plot2D.hydrograph(f_obs,f_res)

            SettingsIO.save_gbestposition(GbestPositon)
            SettingsIO.save_gbestscore(GbestScore)
            Report.write_report()
        Curve[i] = GbestScore

        t2 = time.time()

        # 追加内容
        #计算还需多长时间
        pred_time = (t2-t1)*(Max_iter-i-1)
        str = timer.pred_remain_time(pred_time)
        SettingsIO.update_time(str)

        if GbestScore > valve:
            SettingsIO.progress_bar_update(100 * (i+1)/Max_iter)
            Plot2D.plot(Curve)
            stop_sign = SettingsIO.stop()
            if stop_sign == "0":
                continue
            else:
                break
        else:
            break

    return GbestScore,GbestPositon,Curve









