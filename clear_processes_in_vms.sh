#!/bin/bash
declare -a PASSWORDS=("RlYISVmt8v" "olQhnw9JzJ" "66eWgYhv5J" "pr5ZYog8qI" "yZWd8O9pFF")
USERNAME="user@"
declare -a VMS=("snf-12153.ok-kno.grnetcloud.net" "snf-12154.ok-kno.grnetcloud.net" "snf-12155.ok-kno.grnetcloud.net" "snf-12156.ok-kno.grnetcloud.net" "snf-12157.ok-kno.grnetcloud.net")

arraylength=${#PASSWORDS[@]}
declare -a IPs=("1" "2" "5" "3" "4")

gnome-terminal -- bash -c "/usr/bin/sshpass -p ${PASSWORDS[0]} /usr/bin/ssh $USERNAME${VMS[0]} 'cd noobcash; source .venv/bin/activate; python3 shutdown.py 192.168.0."${IPs[0]}"'" > /dev/null 2>&1
# use for loop to read all values and indexes
for (( i=1; i<$arraylength; i++ ));
do
        gnome-terminal -- bash -c "/usr/bin/sshpass -p ${PASSWORDS[0]} /usr/bin/ssh $USERNAME${VMS[0]} '/usr/bin/ssh $USERNAME${VMS[$i]} \"cd noobcash; source .venv/bin/activate; python3 shutdown.py 192.168.0.${IPs[$i]} \"'" > /dev/null 2>&1
done
