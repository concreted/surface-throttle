#!/bin/bash

echo "Cores: $CORES"
echo "CPU stress %: $CPU_PERCENT"
echo "Throttle threshold: $THROTTLE_THRESHOLD"

stress-ng -c $CORES -l $CPU_PERCENT &

while true;
do
	currentFreq=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq)
	if [ "$DEBUG" == "true" ]; then
		echo $currentFreq
	fi
	if [ "$currentFreq" -lt "$THROTTLE_THRESHOLD" ]; then
		echo "==================== Throttle detected ====================="
		echo "Current freq: $currentFreq"
		echo "Temperature:"
		sensors
		echo "============================================================"
	fi
	sleep 1
done
