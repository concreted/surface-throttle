#!/bin/bash

echo "CPUs: $CPUS"
echo "CPU stress %: $CPU_PERCENT"
echo "Throttle threshold: $THROTTLE_THRESHOLD"

stress-ng -c $CPUS -l $CPU_PERCENT &

while true;
do
	currentFreq=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq)
	if [ "$DEBUG" == "true" ]; then
		echo "==================== Tick ====================="
		echo $currentFreq
		sensors
		echo "==============================================="
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
