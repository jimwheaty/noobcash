f=[0,0,0,0,0]
import numpy as np
from config import *

 
files = np.random.permutation(NUMBER_OF_NODES)
for i in range(NUMBER_OF_NODES):
    f[i] = open(str(NUMBER_OF_NODES)+"nodes/transactions"+str(files[i])+'.txt', "r")

if NUMBER_OF_NODES == 5:
    bal=[10000,10000,10000,10000,10000]
elif NUMBER_OF_NODES == 10:
    bal=[10000,10000,10000,10000,10000,10000,10000,10000,10000,10000]

cnt= 0
for i in range(NUMBER_OF_NODES): #while there is some valid transaction to make
    while  1: #if you have money and haven't finished your transactions
        cnt+=1
        line = f[i].readline()
        if line=='': break
        receiver = int(line[2])
        money = int(line[4:-1])
        
        bal[files[i]]-=money
        bal[receiver]+=money
     
 
print('With 10000NBC starting coins per node \n the final balance of each node should be:\n', bal)
print(cnt)











