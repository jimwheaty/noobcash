#!/bin/bash



USERNAME="user@"
HOST="snf-12153.ok-kno.grnetcloud.net"
PATH=":~/noobcash"
PASSWORD="RlYISVmt8v"

echo 'waiting blockchain to be built...'
/usr/bin/sshpass -p ${PASSWORD} /usr/bin/ssh -o StrictHostKeyChecking=no  ${USERNAME}${HOST} 'cd noobcash; source .venv/bin/activate; cd src; python3 find_block_times.py'
echo 'blockchain built...'

echo 'copying files from snf-12153...'

/usr/bin/sshpass -p ${PASSWORD} /usr/bin/scp  ${USERNAME}${HOST}${PATH}/src/last_block.txt ./measurements/last_block.txt
/usr/bin/sshpass -p ${PASSWORD} /usr/bin/scp  ${USERNAME}${HOST}${PATH}/src/first_block.txt ./measurements/first_block.txt

/usr/bin/sshpass -p ${PASSWORD} /usr/bin/ssh -o StrictHostKeyChecking=no  ${USERNAME}${HOST} 'cd noobcash/src; rm first_block.txt; rm last_block.txt'

echo "done"