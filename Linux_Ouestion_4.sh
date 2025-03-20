# Write a Bash script that finds and kills all processes consuming more than 80% CPU 
# usage.

#!/bin/bash

THRESHOLD=80


ps -eo pid,%cpu --no-headers | awk -v threshold=$THRESHOLD '$2 > threshold {print $1}' | while read pid; do
    echo "Killing process ID: $pid (CPU usage > $THRESHOLD%)"
    kill -9 $pid
done

echo "High CPU usage processes have been terminated."
