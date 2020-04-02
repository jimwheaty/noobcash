from datetime import datetime
trans_times = []
for i in range(12153, 12158):
    for port in range(5000, 5002):
        for s in ['first', 'last']:
            f = open("measurements/"+s+"_transaction_"+str(i)+"_"+str(port)+".txt", "r")
            trans_times.append(f.readline())
            f.close()

start = min(trans_times)
finish = max(trans_times) 
start = datetime.strptime(start, '%Y-%m-%d %H:%M:%S.%f')
finish = datetime.strptime(finish, '%Y-%m-%d %H:%M:%S.%f')

elapsedTime = finish - start
print('total transactions time = ', elapsedTime.total_seconds(), 'seconds')

# print(start[-15:], finish[-15:])

for i in range(12153, 12158):
    for port in range(5000, 5002):
        for s in ['first']:
            f = open("measurements/"+s+"_transaction_"+str(i)+"_"+str(port)+".txt", "r")
            print(f.readline())
            f.close()
print()
for i in range(12153, 12158):
    for port in range(5000, 5002):
        for s in ['last']:
            f = open("measurements/"+s+"_transaction_"+str(i)+"_"+str(port)+".txt", "r")
            print(f.readline())
            f.close()