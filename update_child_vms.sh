#!/bin/bash
## declare an array variable

## this file should be run in snf12153!

declare -a PASSWORDS=("olQhnw9JzJ" "66eWgYhv5J" "pr5ZYog8qI" "yZWd8O9pFF")

USERNAME="user@"
declare -a VMS=("snf-12154.ok-kno.grnetcloud.net" "snf-12155.ok-kno.grnetcloud.net" "snf-12156.ok-kno.grnetcloud.net" "snf-12157.ok-kno.grnetcloud.net")
PATH=":~/noobcash"

arraylength=${#PASSWORDS[@]}

# use for loop to read all values and indexes
for (( i=0; i<${arraylength}; i++ ));
do
	/usr/bin/sshpass -p ${PASSWORDS[$i]}  /usr/bin/scp -r 5nodes 10nodes client.py requirements.txt shutdown.py ${USERNAME}${VMS[$i]}${PATH}
done

cd src/

for (( i=0; i<${arraylength}; i++ )); 
do
	/usr/bin/sshpass -p ${PASSWORDS[$i]}  /usr/bin/scp *.py ${USERNAME}${VMS[$i]}${PATH}/src

done
