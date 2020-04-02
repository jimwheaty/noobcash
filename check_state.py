from src.broadcast import Broadcast

import jsonpickle
import asyncio

from argparse import ArgumentParser

parser = ArgumentParser()
parser.add_argument('-n', '--nodes', default=5, type=int, help='number of nodes running')
args = parser.parse_args()
n = args.nodes
 
host = '192.168.0.1:5000'  
b = Broadcast(host)
if n == 5:
    b.peers = ['192.168.0.2:5000', '192.168.0.3:5000', '192.168.0.4:5000', '192.168.0.5:5000']
elif n == 10:
    b.peers = ['192.168.0.2:5000', '192.168.0.3:5000', '192.168.0.4:5000', '192.168.0.5:5000','192.168.0.1:5001', '192.168.0.2:5001', '192.168.0.3:5001', '192.168.0.4:5001', '192.168.0.5:5001']
    

responses = asyncio.run(b.broadcast('get_pending_lengths', {}, 'GET'))
pending_lengths = map(jsonpickle.decode, responses)

print("Pending lengths:\n")
for tx in pending_lengths:
    print (f'{tx["host"]} -> {tx["data"]}')



responses = asyncio.run(b.broadcast('get_orphan_lengths', {}, 'GET'))
orphan_lengths = map(jsonpickle.decode, responses)

print("\nOrphan_lengths:\n")
for tx in orphan_lengths:
    print (f'{tx["host"]} -> {tx["data"]}')



responses = asyncio.run(b.broadcast('get_blockchain_length', {}, 'GET'))
blockchain_lengths = map(jsonpickle.decode, responses)

print("\n\nBlockchain lengths:\n")
for tx in blockchain_lengths:
    print (f'{tx["host"]} -> {tx["data"]}')

