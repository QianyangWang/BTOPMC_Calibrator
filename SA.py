import numpy as np
import random
import copy
import SettingsIO
import Plot2D
import time
import timer


def mu_inv(y,mu):
    #模拟退火产生新位置偏差
    x=(((1+mu)**np.abs(y)-1)/mu)*np.sign(y)
    return x


'''模拟退火算法'''
def SA(population,dim,lb,ub,Max_iter,fun,f_obs,f_res,valve):
    TolFun = 10**-10 #优化变化容忍度
    x0 = (ub.T-lb.T)*np.random.random([1,dim]) + lb.T
    fx = fun(x0)#计算适应度值
    f0=fx
    x = x0
    count = 0#用于记录收敛曲线标记
    Curve = np.zeros(Max_iter)

    SettingsIO.save_gbestposition(x0)
    SettingsIO.save_gbestscore(f0)

    for m in range(Max_iter):
        t1 = time.time()
        T = m/(Max_iter+1) #温度
        mu = 10**(T*100)
        for k in range(100):
            dx = mu_inv(2*np.random.random([1,dim])-1,mu)*(ub.T-lb.T)
            x1 = x + dx
            for j in range(dim):
                if x1[0,j]>ub[j]:
                    x1[0,j]=ub[j]
                if x1[0,j]<lb[j]:
                    x1[0,j]=lb[j]
            #计算当前位置适应度值和适应度值偏差
            fx1 = fun(x1)
            df = fx1 - fx
            #如果df<0则接受该解，如果大于0 则利用Metropolis准则进行判断是否接受
            if df<0 or np.random.random()<np.exp(-T*df/(np.abs(fx)+2**-52)/TolFun):
                x=x1
                fx=fx1
            if fx1 <f0:
                x0=x1
                f0=fx1
                time.sleep(0.3)
                preheating = SettingsIO.get_preheating()
                Plot2D.hydrograph(f_obs, f_res,preheating)
                time.sleep(0.3)

                SettingsIO.save_gbestposition(x0)
                SettingsIO.save_gbestscore(f0)

        Curve[count] = f0
        count = count + 1

        t2 = time.time()
        # 追加内容
        # 计算还需多长时间
        pred_time = (t2 - t1) * (Max_iter - m - 1)
        str = timer.pred_remain_time(pred_time)
        SettingsIO.update_time(str)
        print(f0)

        if f0 > valve:
            SettingsIO.progress_bar_update(100 * (m + 1) / Max_iter)
            Plot2D.plot(Curve)
            stop_sign = SettingsIO.stop()
            if stop_sign == "0":
                continue
            else:
                break
        else:
            break

    GbestScore = f0
    GbestPositon = x0

    return GbestScore,GbestPositon,Curve







