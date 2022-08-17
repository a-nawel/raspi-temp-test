# raspi-temp-test

Steps to run on a new raspi (e.g. raspi-e4:5f:01:56:d5:2b):

### ・Clone the github repo:
salt 'raspi-e4:5f:01:56:d5:2b' cmd.run 'git clone https://github.com/a-nawel/raspi-temp-test.git'

### ・Make the scripts executable 
	salt 'raspi-e4:5f:01:56:d5:2b' cmd.run 'chmod +x /root/raspi-temp-test/stress-test.sh'
	salt 'raspi-e4:5f:01:56:d5:2b' cmd.run 'chmod +x /root/raspi-temp-test/temp-sampling.sh'
	
### ・Install stress-ng
	sudo apt -y install stress-ng mesa-utils 
	
### ・Run the load test with temperature sampling
	salt 'raspi-e4:5f:01:56:d5:2b' cmd.run 'cd /root/raspi-temp-test; ./stress-test.sh >/dev/null 2>&1 &'
	
### ・Run the temperature sampling only (idle state)
	salt 'raspi-e4:5f:01:56:d5:2b' cmd.run 'cd /root/raspi-temp-test; ./temp-sampling.sh >/dev/null 2>&1 &'
	
### ・Check Temperature
	salt 'raspi-e4:5f:01:56:d5:2b' cmd.run 'cat /sys/class/thermal/thermal_zone0/temp'

### ・Check the results file
	salt 'raspi-e4:5f:01:56:d5:2b' cmd.run 'cat /root/raspi-temp-test/temp-results.txt'

### ・Check the CPU speed:
salt 'raspi-e4:5f:01:56:d5:2b' cmd.run 'cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq'
