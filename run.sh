#!/bin/bash
python3 calc_final_state.py
for i in {0..4}
do
    gnome-terminal -- bash -c "source .venv/bin/activate; cd src; python3 rest.py -i 127.0.0.1 -p 500$i; bash" > /dev/null 2>&1
done

for i in {0..4}
do
    gnome-terminal -- bash -c "source .venv/bin/activate; python3 client.py 127.0.0.1 500$i; bash" > /dev/null 2>&1
    sleep 3
done

gnome-terminal -- bash -c "source .venv/bin/activate; python3 stress_test.py; bash" > /dev/null 2>&1

