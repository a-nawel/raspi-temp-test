#!/bin/bash

# Start the sampling process 
./temp-sampling.sh >/dev/null 2>&1 &

# Calculate the value of pi for 20 min 
stress-ng --cpu 0 --cpu-method pi -t 20m

# Kill the sampling process
killall temp-sampling.sh
