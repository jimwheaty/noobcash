declare -a PASSWORDS=("olQhnw9JzJ" "66eWgYhv5J" "pr5ZYog8qI" "yZWd8O9pFF")
declare -a NAMES=("12154" "12155" "12156" "12157")
USERNAME="user@"
declare -a VMS=("snf-12154.ok-kno.grnetcloud.net" "snf-12155.ok-kno.grnetcloud.net" "snf-12156.ok-kno.grnetcloud.net" "snf-12157.ok-kno.grnetcloud.net")
PATH=":~/noobcash"

arraylength=${#PASSWORDS[@]}

cd src/

for (( i=0; i<${arraylength}; i++ )); 
do
    echo  ${PASSWORDS[$i]} /usr/bin/scp  ${USERNAME}${VMS[$i]}${PATH}/src/last_transaction.txt ./last_transaction_${NAMES[$i]}.txt
	/usr/bin/sshpass -p ${PASSWORDS[$i]} /usr/bin/scp  ${USERNAME}${VMS[$i]}${PATH}/src/last_transaction.txt last_transaction_${NAMES[$i]}.txt
    /usr/bin/sshpass -p ${PASSWORDS[$i]} /usr/bin/scp  ${USERNAME}${VMS[$i]}${PATH}/src/first_transaction.txt first_transaction_${NAMES[$i]}.txt

    /usr/bin/sshpass -p ${PASSWORDS[$i]} /usr/bin/ssh -o StrictHostKeyChecking=no  ${USERNAME}${VMS[$i]} 'cd noobcash/src; rm *.txt'

done