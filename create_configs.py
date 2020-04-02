for cap in ['1','5','10']:
    for diff in ['4','5']:
        for nodes in['5','10']:
            f = open("./configs/config_cap"+cap+"_diff"+diff+"_nodes"+nodes+".py", "w")
            
            s = "NUMBER_OF_NODES = "+nodes+"\n"
            s+="STARTING_NBC_PER_NODE = 10000 \n"
            s+="BOOTSTRAP = '192.168.0.1:5000'\n"
            s+="BLOCK_CAPACITY = "+cap+"\n"
            s+="MINING_DIFFICULTY = "+diff+"\n"

            f.write(s)
            f.close()
