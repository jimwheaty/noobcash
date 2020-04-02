#!/bin/bash
echo 'updating vm files...'
./update_all_vms.sh
echo 'done'
echo 'clearing processes in vms...'
./clear_processes_in_vms.sh
sleep 10
echo 'done'
echo 'starting vms and connecting nodes...'
./run_on_vms.sh
sleep 50 #10sec*10nodes (worst case) wait for nodes to connect, fetch_block_times.sh runs rest
echo 'done'
echo 'waiting for blockchain to be built and fetching measurements...'
./fetch_block_times.sh; ./fetch_logs.sh #fetch_logs.sh should run after all transactions are made. fetch_block_times.sh does the waiting
echo 'done'


#TODO!!!!!!!!
#kati san to parakatw:
cap=[1,5,10]
diff=[4,5]
nodes=[5,10]
#$configurations = [... ...   ....]
# for $conf in $configurations:
#     cp $conf ./src/config.py
#     ./update_all_vms.sh
#     ./clear_processes_in_vms.sh
#     sleep 10
#     ./run_on_vms.sh
#     sleep 100 #10sec*10nodes (worst case) wait for nodes to connect, fetch_block_times.sh runs rest    peirmatika omws fainetai pws mporei na einai kai ligotero, px 20 (????)
#     ./fetch_block_times.sh $conf; ./fetch_logs.sh $conf #fetch_logs.sh should run after all transactions are made. fetch_block_times.sh does the waiting
#     #ta fetch trexoun me orisma $conf, to opoio xrhsimopoioun gia na dwsoun katallhlo onoma sto local arxeio pou tha paraxthei.
#     #Ta arxeia sta vm exoun panta to idio onoma kai apla diagrafontai kathe fora afou antigrafoun sto local
