#!/bin/bash
cap=[1,5,10]
diff=[4,5]
nodes=[5,10]

# declare -a CONFIGs=("config_cap10_diff5_nodes10")
declare -a CONFIGs=("config_cap1_diff4_nodes5" "config_cap5_diff4_nodes5" "config_cap10_diff4_nodes5" "config_cap1_diff5_nodes5" "config_cap5_diff5_nodes5" "config_cap10_diff5_nodes5" "config_cap1_diff4_nodes10" "config_cap5_diff4_nodes10" "config_cap10_diff4_nodes10" "config_cap1_diff5_nodes10" "config_cap5_diff5_nodes10" "config_cap10_diff5_nodes10")

arraylength=${#CONFIGs[@]}
for (( i=0; i<${arraylength}; i++ )); 
do
    cp configs/${CONFIGs[i]}.py src/config.py
    echo "configuration: ${CONFIGs[i]}"
    echo 'updating vm files...'
    ./update_all_vms.sh
    echo 'done'
    echo 'clearing processes in vms...'
    ./clear_processes_in_vms.sh
    sleep 3
    echo 'done'
    echo 'starting vms and connecting nodes...'
    if [ $i -gt 5 ]
    then
        ./run_on_vms10.sh
    else
        ./run_on_vms5.sh
    fi
    sleep 55 #5sec*10nodes+10% (worst case) wait for nodes to connect, fetch_block_times.sh runs rest
    echo 'done'
    echo 'waiting for blockchain to be built and fetching measurements...'
    ./fetch_block_times.sh ${CONFIGs[i]}; ./fetch_logs.sh ${CONFIGs[i]}
    #fetch_logs.sh should run after all transactions are made. fetch_block_times.sh does the waiting
    #ta fetch trexoun me orisma $conf, to opoio xrhsimopoioun gia na dwsoun katallhlo onoma sto local arxeio pou tha paraxthei.
    #Ta arxeia sta vm exoun panta to idio onoma kai apla diagrafontai kathe fora afou antigrafoun sto local
    echo 'done'
    killall bash
done