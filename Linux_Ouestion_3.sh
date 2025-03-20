# Write a Bash script that monitors CPU and memory usage every 5 seconds and logs 
# the data into a file.

#!/bin/bash

LOG_FILE="CPU_MEMORY.log"

LogFile() {
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    MEM_USAGE=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')

    echo "$TIMESTAMP - CPU: $CPU_USAGE% | Memory: $MEM_USAGE" >> $LOG_FILE
}

# Run the script every 5 seconds
a=1
while true; do
    LogFile
    sleep 5
    echo "${a} Log File Updated"
    ((a++))
done
