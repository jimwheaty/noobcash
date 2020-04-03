from config import *
from broadcast import Broadcast

import time
import jsonpickle
import json
import requests
import sys
import asyncio

host = '192.168.0.1:5000'  
broadcast = Broadcast(host)
broadcast.peers = ['192.168.0.2:5000', '192.168.0.3:5000', '192.168.0.4:5000', '192.168.0.5:5000']

if NUMBER_OF_NODES == 10:
    num_of_transactions = 1009 #30
else: num_of_transactions = 504 #15

while 1:
    # sleep(10 sec)
    # l=get_chain_len(153)
    # if l ==...:
    #     c=get_chain
    #     res = find_first_last_timestamp(c, 153)
    #     write(res,'res.txt')

    time.sleep(30)
    
    responses = asyncio.run(broadcast.broadcast('get_blockchain_length', {}, 'GET'))
    blockchain_lengths = map(jsonpickle.decode, responses)
    sorted_blockchain_lengths = sorted(blockchain_lengths, key=lambda item: item['data'], reverse=True)
    length = 0
    if len(sorted_blockchain_lengths)>0:
        item = sorted_blockchain_lengths[0]
        length = int(item['data'])

    if length >= 1 + num_of_transactions //  BLOCK_CAPACITY:
        
        url = f'http://{item["host"]}/get_blockchain'
        headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}
        response = requests.get(url, headers)
        blockchain = jsonpickle.decode(response.json())['data']
        first_time = blockchain[0].timestamp
        last_time = blockchain[-1].timestamp

        f1 = open("first_block.txt", "w")
        f1.write(first_time)
        f1.close()

        f2 = open("last_block.txt", "w")
        f2.write(last_time)
        f2.close()
        
        break

    else: continue


    