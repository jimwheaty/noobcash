#!/bin/bash
# python3 calc_final_state.py
declare -a PASSWORDS=("RlYISVmt8v" "olQhnw9JzJ" "66eWgYhv5J" "pr5ZYog8qI" "yZWd8O9pFF")
USERNAME="user@"
declare -a VMS=("snf-12153.ok-kno.grnetcloud.net" "snf-12154.ok-kno.grnetcloud.net" "snf-12155.ok-kno.grnetcloud.net" "snf-12156.ok-kno.grnetcloud.net" "snf-12157.ok-kno.grnetcloud.net")
declare -a IPs=("1" "2" "5" "3" "4")

arraylength=${#PASSWORDS[@]}


gnome-terminal -- bash -c "/usr/bin/sshpass -p ${PASSWORDS[0]} /usr/bin/ssh $USERNAME${VMS[0]} 'cd noobcash; source .venv/bin/activate; cd src; python3 rest.py -i 192.168.0."${IPs[0]}" -p 5000';bash" 
# use for loop to read all values and indexes
for (( i=1; i<$arraylength; i++ ));
do
    gnome-terminal -- bash -c "/usr/bin/sshpass -p ${PASSWORDS[0]} /usr/bin/ssh $USERNAME${VMS[0]} '/usr/bin/ssh $USERNAME${VMS[$i]} \"cd noobcash; source .venv/bin/activate; cd src; python3 rest.py -i 192.168.0.${IPs[$i]} -p 5000\"';bash" 
done

gnome-terminal -- bash -c "/usr/bin/sshpass -p ${PASSWORDS[0]} /usr/bin/ssh $USERNAME${VMS[0]} 'cd noobcash; source .venv/bin/activate; python3 client.py 192.168.0."${IPs[0]}" 5000';bash" 
sleep 9
for (( i=1; i<$arraylength; i++ ));
do
    gnome-terminal -- bash -c "/usr/bin/sshpass -p ${PASSWORDS[0]} /usr/bin/ssh $USERNAME${VMS[0]} '/usr/bin/ssh $USERNAME${VMS[$i]} \"cd noobcash; source .venv/bin/activate; python3 client.py 192.168.0.${IPs[$i]} 5000\"';bash" 
    sleep 3
done

gnome-terminal -- bash -c "/usr/bin/sshpass -p ${PASSWORDS[0]} /usr/bin/ssh $USERNAME${VMS[0]} 'cd noobcash; source .venv/bin/activate; python3 stress_test.py';bash" 

