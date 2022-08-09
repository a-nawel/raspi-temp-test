#!/bin/bash

printf "Temperature test %s\nDevice: raspi-%s" "$(date)" "$(cat /sys/class/net/eth0/address)" > temp-results.txt
./temp-sampling.sh >/dev/null 2>&1 &

# Calculate the value of pi for 20 min 
stress-ng --cpu 0 --cpu-method pi -t 20m

# Kill the sampling process
killall temp-sampling.sh
