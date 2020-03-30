#!/bin/bash
for i in {0..4}
do
    gnome-terminal -- bash -c "source .venv/bin/activate; cd src; python3 rest.py -i 127.0.0.1 -p 500$i; bash"
    sleep 0.1
done


sleep 1

for i in {0..4}
do
    gnome-terminal -- bash -c "source .venv/bin/activate; python3 client.py 127.0.0.1 500$i; bash"
    sleep 0.1
done

sleep 1

# gnome-terminal -- bash -c "source .venv/bin/activate; python3 stress_test.py; bash"
# gnome-terminal -- bash -c "source .venv/bin/activate; python3 check_state.py; bash"

