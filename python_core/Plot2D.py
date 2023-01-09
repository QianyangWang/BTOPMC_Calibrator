import ResultIO


def plot(curve):
    try:
        with open("Curve.dat","w") as f:
            f.write("ARRAY 1 {}\n".format(len(curve)))
            f.write("HOLE 0\n")
            f.write("# X values\n")
            for i in range(len(curve)):
                f.write(str(i+1)+" ")
                if (i+1) % 10 == 0 and i != len(curve):
                    f.write("\n")
            f.write("\n")
            f.write("# Y values, set 0\n")
            for i in range(len(curve)):
                f.write("%.2f"%(curve[i][0])+"\t")
    except:
        pass


def hydrograph(f_obs,f_result,preheating):
    obs_flow = ResultIO.read_obs(f_obs,preheating)
    pred_flow = ResultIO.read_result(f_result,preheating)
    obs_flow = obs_flow.flatten().tolist()
    pred_flow = pred_flow.flatten().tolist()
    try:
        with open("predplot.dat","w") as f:
            f.write("ARRAY 2 {}\n".format(len(obs_flow)))
            f.write("HOLE 1e+308\n")
            f.write("# X values\n")
            for i in range(len(obs_flow)):
                f.write(str(i) + " ")
                if (i + 1) % 10 == 0 and i != len(obs_flow):
                    f.write("\n")
            f.write("\n")
            f.write("# Y values, set 0\n")
            for i in range(len(obs_flow)):
                f.write(str(obs_flow[i])+"\t")
            f.write("\n")
            f.write("# Y values, set 1\n")
            for i in range(len(obs_flow)):
                f.write(str(pred_flow[i])+"\t")
    except:
        pass