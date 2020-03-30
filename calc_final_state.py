f=[0,0,0,0,0]
import numpy as np
files = np.random.permutation(5)
for i in range(5):
    f[i] = open("5nodes/transactions"+str(files[i])+'.txt', "r")

bal=[10000,10000,10000,10000,10000]
cnt= 0
for i in range(5): #while there is some valid transaction to make
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











