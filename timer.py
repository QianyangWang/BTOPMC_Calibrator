
def pred_remain_time(t):
    h = int(t//3600)
    m = int((t%3600)//60)
    s = int(((t%3600)%60))
    return "{}h{}m{}s".format(h,m,s)
