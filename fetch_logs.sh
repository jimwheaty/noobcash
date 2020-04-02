#!/bin/bash

USERNAME="user@"
HOST="snf-12153.ok-kno.grnetcloud.net"
PATH=":~/noobcash"
PASSWORD="RlYISVmt8v"
echo 'copying files from snf-12153...'

cd src/

/usr/bin/sshpass -p ${PASSWORD} /usr/bin/scp  ${USERNAME}${HOST}${PATH}/src/last_transaction.txt ../measurements/last_transaction_12153.txt
/usr/bin/sshpass -p ${PASSWORD} /usr/bin/scp  ${USERNAME}${HOST}${PATH}/src/first_transaction.txt ../measurements/first_transaction_12153.txt

/usr/bin/sshpass -p ${PASSWORD} /usr/bin/ssh -o StrictHostKeyChecking=no  ${USERNAME}${HOST} 'cd noobcash/src; rm *.txt'




echo "done"
echo "copying files from remote vms"


/usr/bin/sshpass -p ${PASSWORD} /usr/bin/ssh -o StrictHostKeyChecking=no ${USERNAME}${HOST} 'cd noobcash; chmod +x cp_from_children.sh; ./cp_from_children.sh;'
echo "done"


declare -a NAMES=("12154" "12155" "12156" "12157")
arraylength=4


for (( i=0; i<${arraylength}; i++ )); 
do
    echo  ${PASSWORD} /usr/bin/scp  ${USERNAME}${HOST}${PATH}/src/last_transaction_${NAMES[$i]}.txt last_transaction_${NAMES[$i]}.txt
	/usr/bin/sshpass -p ${PASSWORD} /usr/bin/scp  ${USERNAME}${HOST}${PATH}/src/last_transaction_${NAMES[$i]}.txt ../measurements/last_transaction_${NAMES[$i]}.txt
    /usr/bin/sshpass -p ${PASSWORD} /usr/bin/scp  ${USERNAME}${HOST}${PATH}/src/first_transaction_${NAMES[$i]}.txt ../measurements/first_transaction_${NAMES[$i]}.txt

done



