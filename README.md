# Noobcash
A simple blockchain system for validating transactions using Proof of work. Created as a project for NTUA ECE Distributed Systems 2019-2020 course.

## Installation

Install requires packages:

	$ sudo apt-get install python3 python3-pip python3-requests python3-virtualenv

## Setup
	$ tar xvfz noobcash.tar.gz
    $ cd noobcash
    $ sudo apt install virtualenv sshpass
    $ virtualenv .venv
    $ source .venv/bin/activate
    $ pip3 install -r requirements.txt


## Parameters
You can configure the parameters in noobcash/src/config.py:

* NUMBER_OF_NODES
* BOOTSTRAP
* BLOCK_CAPACITY 
* MINING_DIFFICULTY

## Usage




./update_all_vms.sh
./run_on_vms.sh

elegxw an mphkan oloi entos 3 sec alliws to kleinw
paw sto proteleutaio terminal kia grafw balance gia na eleg3w thn orthothta

./clear_processes_in_vms.sh



First of all start a server for each participant:

    $ cd noobcash/src
    $ source .venv/bin/activate
    $ python3 rest.py -i [IP] -p [PORT]

Then in a separate terminal start a client for each participant:

    $ cd noobcash
    $ source .venv/bin/activate
    $ python3 client.py [IP] [PORT]


## Commands

From the client you can give the following commands:

* `t [recipient_id] [amount]` 
* `balance`                   
* `view`                      
* `view all`                  
* `exit`                      
