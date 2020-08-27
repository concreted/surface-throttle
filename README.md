# Surface Throttle Test

Runs a benchmark in Chromium and logs when throttle events are detected.

Example of throttle event log, which includes current CPU freq (we only look at cpu0), and last captured temperature before the throttle event began.
```
27.08.20 12:32:56 (-0700)  throttle  ==================== Throttle detected =====================
27.08.20 12:32:56 (-0700)  throttle  Current freq (hz): 400000
27.08.20 12:32:56 (-0700)  throttle
27.08.20 12:32:56 (-0700)  throttle  Last captured temperature before throttle started:
27.08.20 12:32:56 (-0700)  throttle  iwlwifi-virtual-0
27.08.20 12:32:56 (-0700)  throttle  Adapter: Virtual device
27.08.20 12:32:56 (-0700)  throttle  temp1:        +57.0°C
27.08.20 12:32:56 (-0700)  throttle
27.08.20 12:32:56 (-0700)  throttle  acpitz-acpi-0
27.08.20 12:32:56 (-0700)  throttle  Adapter: ACPI interface
27.08.20 12:32:56 (-0700)  throttle  temp1:        +43.0°C
27.08.20 12:32:56 (-0700)  throttle
27.08.20 12:32:56 (-0700)  throttle  coretemp-isa-0000
27.08.20 12:32:56 (-0700)  throttle  Adapter: ISA adapter
27.08.20 12:32:56 (-0700)  throttle  Package id 0:  +69.0°C  (high = +100.0°C, crit = +100.0°C)
27.08.20 12:32:56 (-0700)  throttle  Core 0:        +69.0°C  (high = +100.0°C, crit = +100.0°C)
27.08.20 12:32:56 (-0700)  throttle  Core 1:        +67.0°C  (high = +100.0°C, crit = +100.0°C)
27.08.20 12:32:56 (-0700)  throttle  ============================================================
```

## Env vars
```
# set to `true` to run stress-ng in addition to chromium benchmark
RUN_STRESS=false
# how many CPUs to stress in stress-ng. 0 means all CPUs
CPUS=0
# how much CPU to use in stress-ng
CPU_PERCENT=100
# threshold to report throttle events in stdout
THROTTLE_THRESHOLD=800000
# set to `true` to log freq on every tick
DEBUG=false
```
