import multiprocessing
import time
import random

def func(msg):
    ran = random.random()
    time.sleep(ran)
    return multiprocessing.current_process().name + '-' + msg


if __name__ == "__main__":
    for j in range(5):
        pool = multiprocessing.Pool(processes=4) # 创建4个进程
        results = []

        for i in range(1,11):
            msg = "hello %d" %(i)
            results.append(pool.apply_async(func, (msg, )))
        pool.close() # 关闭进程池，表示不能再往进程池中添加进程，需要在join之前调用
        pool.join() # 等待进程池中的所有进程执行完毕
        print ("Sub-process(es) done.")

        for res in results:
            print (res.get())
        pool.terminate()

