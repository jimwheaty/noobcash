from src.broadcast import Broadcast
import asyncio
from argparse import ArgumentParser

parser = ArgumentParser()
parser.add_argument('-n', '--nodes', default=5, type=int, help='number of nodes running')
args = parser.parse_args()
n = args.nodes

# b = Broadcast('test')
# for i in range(n):
#     b.add_peer(f'127.0.0.1:500{i}')

IPs = ["1", "2", "5", "3", "4"]
b = Broadcast('test')
for i in range(n):
    b.add_peer(f'192.168.0.{IPs[i]}:5000')

responses = asyncio.run(b.broadcast('stress_test', n, 'POST'))