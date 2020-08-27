#!/bin/bash

echo "RUN_STRESS=$RUN_STRESS"
echo "CPUS=$CPUS"
echo "CPU_PERCENT=$CPU_PERCENT"
echo "THROTTLE_THRESHOLD=$THROTTLE_THRESHOLD"

if [ "$RUN_STRESS" == "true" ]; then
	stress-ng -c $CPUS -l $CPU_PERCENT &
fi

startx &

lastSensors="none"

while true;
do
	currentFreq=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq)
	currentSensors=$(sensors)
	if [ "$DEBUG" == "true" ]; then
		echo "==================== Tick ====================="
		echo $currentFreq
		sensors
		echo "==============================================="
	fi
	if [ "$currentFreq" -lt "$THROTTLE_THRESHOLD" ]; then
		echo "==================== Throttle detected ====================="
		echo "Current freq: $currentFreq"
		echo "Last captured temperature before throttle started:"
		echo "$lastSensors"
		echo "============================================================"
	else
		lastSensors=$currentSensors
	fi
	sleep 2
done
