#!/bin/bash

LOG_FILE="$HOME/system_health.log"
touch "$LOG_FILE"

# Function to log messages
log_message() {
    echo "$(date) - $1" | tee -a "$LOG_FILE"
}

# Check CPU Usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
if (( $(echo "$CPU_USAGE > 80" | bc -l) )); then
    log_message "High CPU Usage: $CPU_USAGE%"
fi

# Check Memory Usage
MEM_USAGE=$(free | awk '/Mem:/ {printf "%.2f", $3/$2 * 100}')
if (( $(echo "$MEM_USAGE > 80" | bc -l) )); then
    log_message "High Memory Usage: $MEM_USAGE%"
fi

# Check Disk Space
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
if [ "$DISK_USAGE" -gt 80 ]; then
    log_message "Low Disk Space: $DISK_USAGE%"
fi

# Check Running Processes
PROCESS_COUNT=$(ps aux --no-heading | wc -l)
if [ "$PROCESS_COUNT" -gt 200 ]; then
    log_message "High Process Count: $PROCESS_COUNT"
fi

log_message "System health check completed."

# Display the log file for debugging
cat "$LOG_FILE"
