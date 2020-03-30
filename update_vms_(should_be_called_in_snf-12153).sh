#!/bin/bash
## declare an array variable
declare -a PASSWORDS=("olQhnw9JzJ" "66eWgYhv5J" "pr5ZYog8qI" "yZWd8O9pFF")

USERNAME="user@"
declare -a VMS=("snf-12154.ok-kno.grnetcloud.net" "snf-12155.ok-kno.grnetcloud.net" "snf-12156.ok-kno.grnetcloud.net" "snf-12157.ok-kno.grnetcloud.net")
PATH=":~/noobcash"

arraylength=${#PASSWORDS[@]}

# use for loop to read all values and indexes
for (( i=0; i<${arraylength}; i++ ));
do
	/usr/bin/sshpass -p ${PASSWORDS[$i]}  /usr/bin/scp client.py requirements.txt ${USERNAME}${VMS[$i]}${PATH}
done

cd src/

for (( i=0; i<${arraylength}; i++ )); 
do
	/usr/bin/sshpass -p ${PASSWORDS[$i]}  /usr/bin/scp miner.py block.py config.py rest.py test.py transaction.py broadcast.py node.py ring_node.py transaction_output.py wallet.py ${USERNAME}${VMS[$i]}${PATH}/src

done
