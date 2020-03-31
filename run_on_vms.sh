#!/bin/bash
# python3 calc_final_state.py
declare -a PASSWORDS=("RlYISVmt8v" "olQhnw9JzJ" "66eWgYhv5J" "pr5ZYog8qI" "yZWd8O9pFF")
USERNAME="user@"
declare -a VMS=("snf-12153.ok-kno.grnetcloud.net" "snf-12154.ok-kno.grnetcloud.net" "snf-12155.ok-kno.grnetcloud.net" "snf-12156.ok-kno.grnetcloud.net" "snf-12157.ok-kno.grnetcloud.net")
declare -a IPs=("1" "2" "5" "3" "4")

arraylength=${#PASSWORDS[@]}

# use for loop to read all values and indexes
for (( i=0; i<$arraylength; i++ ));
do
    #echo "/usr/bin/sshpass -p ${PASSWORDS[$i]} /usr/bin/ssh $USERNAME${VMS[$i]} 'cd noobcash; source .venv/bin/activate; cd src; python3 rest.py -i 192.168.0."${IPs[$i]}" -p 5000';bash"
    gnome-terminal -- bash -c "/usr/bin/sshpass -p ${PASSWORDS[$i]} /usr/bin/ssh $USERNAME${VMS[$i]} 'cd noobcash; source .venv/bin/activate; cd src; python3 rest.py -i 192.168.0."${IPs[$i]}" -p 5000';bash" 
done

for (( i=0; i<$arraylength; i++ ));
do
    #echo "/usr/bin/sshpass -p ${PASSWORDS[$i]} /usr/bin/ssh $USERNAME${VMS[$i]} 'cd noobcash; source .venv/bin/activate; python3 client.py 192.168.0."${IPs[$i]}" 5000';bash"
    gnome-terminal -- bash -c "/usr/bin/sshpass -p ${PASSWORDS[$i]} /usr/bin/ssh $USERNAME${VMS[$i]} 'cd noobcash; source .venv/bin/activate; python3 client.py 192.168.0."${IPs[$i]}" 5000';bash" 
    sleep 3
done

#echo "/usr/bin/sshpass -p ${PASSWORDS[0]} /usr/bin/ssh $USERNAME${VMS[0]} 'cd noobcash; source .venv/bin/activate; python3 stress_test.py';bash" 
gnome-terminal -- bash -c "/usr/bin/sshpass -p ${PASSWORDS[0]} /usr/bin/ssh $USERNAME${VMS[0]} 'cd noobcash; source .venv/bin/activate; python3 stress_test.py';bash" 

