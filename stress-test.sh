#!/bin/bash
  
printf "Temperature test %s\nDevice: raspi-%s" "$(date)" "$(cat /sys/class/net/eth0/address)" > temp-results.txt
while true; do cat /sys/class/thermal/thermal_zone0/temp; sleep 2; done
