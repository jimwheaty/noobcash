f=[0,0,0,0,0]
import numpy as np
files = np.random.permutation(5)
# files = [0,1,2,3,4]
for i in range(5):
    f[i] = open("5nodes/transactions"+str(files[i])+'.txt', "r")

# while you have money make transactions

bal=[100,100,100,100,100]

cur=4
pending=[0,0,0,0,0] #node is stuck at some transaction
line=["a","a","a","a","a"]
cnt_no_changes=0
cnt_transactions_seen=0
node_finished=[0,0,0,0,0]
cnt_transactions_done=0
while cnt_no_changes<=5: #while there is some valid transaction to make
    print('node=',cur,'\n')
    while bal[cur]>0 and line[cur] != '': #if you have money and haven't finished your transactions
        if not pending[cur]:
            line[cur] = f[cur].readline()
            cnt_no_changes=0
            if line[cur] != '': cnt_transactions_seen+=1
        if line[cur] == '': 
            node_finished[cur]=1
            break
        receiver = int(line[cur][2])
        money = int(line[cur][4:-1])
        
        if money >500:
            cnt_transactions_done+=1
            continue
        print('money', money)
        if money<=bal[files[cur]]:
            bal[files[cur]]-=money
            bal[receiver]+=money
            pending[cur]=0
            cnt_transactions_done+=1
            print('all balances:', bal)
        else: 
            pending[cur]=1
            break
        
    cur=(cur+1)%5
    cnt_no_changes+=1
[207, 3, 120, 145, 25]
print('cnt_transactions_seen = ', cnt_transactions_seen)
print('node_finished = ', node_finished)
print('cnt_transactions_done = ', cnt_transactions_done)









f=[0,0,0,0,0]
import numpy as np
files = np.random.permutation(5)
for i in range(5):
    f[i] = open("5nodes/transactions"+str(files[i])+'.txt', "r")

bal=[100,100,100,100,100]
cnt= 0
for i in range(5): #while there is some valid transaction to make
    while  1: #if you have money and haven't finished your transactions
        cnt+=1
        line = f[i].readline()
        if line=='': break
        receiver = int(line[2])
        money = int(line[4:-1])
        
        if money >150:
            continue
        
        bal[files[i]]-=money
        bal[receiver]+=money
     
 
print('final bal = ', bal)
print(cnt)











