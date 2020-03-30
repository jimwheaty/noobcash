#!/bin/bash

USERNAME="user@"
HOST="snf-12153.ok-kno.grnetcloud.net"
PATH=":~/noobcash"
PASSWORD="RlYISVmt8v"
echo 'copying files to snf-12153...'
/usr/bin/sshpass -p ${PASSWORD}  /usr/bin/scp client.py requirements.txt ${USERNAME}${HOST}${PATH}

cd src/

/usr/bin/sshpass -p ${PASSWORD} /usr/bin/scp miner.py block.py config.py rest.py transaction.py broadcast.py node.py ring_node.py transaction_output.py wallet.py ${USERNAME}${HOST}${PATH}/src

echo "copying files to remote vms"

/usr/bin/sshpass -p ${PASSWORD} /usr/bin/ssh -o StrictHostKeyChecking=no ${USERNAME}${HOST} '~/update_vms.sh'