#!/bin/bash

USERNAME="user@"
HOST="snf-12153.ok-kno.grnetcloud.net"
PATH=":~/noobcash"
PASSWORD="RlYISVmt8v"
echo 'copying files to snf-12153...'
/usr/bin/sshpass -p ${PASSWORD}  /usr/bin/scp client.py run_on_vms.sh update_child_vms.sh requirements.txt stress_test.py shutdown.py ${USERNAME}${HOST}${PATH}

cd src/

/usr/bin/sshpass -p ${PASSWORD} /usr/bin/scp miner.py block.py config.py rest.py transaction.py broadcast.py node.py ring_node.py transaction_output.py wallet.py ${USERNAME}${HOST}${PATH}/src
echo "done"
echo "copying files to remote vms"

/usr/bin/sshpass -p ${PASSWORD} /usr/bin/ssh -o StrictHostKeyChecking=no ${USERNAME}${HOST} 'cd noobcash; ./update_child_vms.sh'
echo "done"