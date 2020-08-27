# Surface Throttle Test

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
