#!/bin/bash

LOG_FILE="/var/log/apache2/access.log"  # Change if using Nginx: /var/log/nginx/access.log
REPORT_FILE="$HOME/web_log_report.txt"

# Ensure the log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: Log file $LOG_FILE not found!"
    exit 1
fi

# Write a header
echo "===================================" > "$REPORT_FILE"
echo "Web Server Log Analysis Report - $(date)" >> "$REPORT_FILE"
echo "===================================" >> "$REPORT_FILE"

# Total requests
TOTAL_REQUESTS=$(wc -l < "$LOG_FILE")
echo "Total Requests: $TOTAL_REQUESTS" >> "$REPORT_FILE"

# Count 404 errors
NOT_FOUND_ERRORS=$(grep " 404 " "$LOG_FILE" | wc -l)
echo "404 Errors: $NOT_FOUND_ERRORS" >> "$REPORT_FILE"

# Most requested pages
echo -e "\nTop 10 Most Requested Pages:" >> "$REPORT_FILE"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -10 >> "$REPORT_FILE"

# Top IPs making requests
echo -e "\nTop 10 IP Addresses:" >> "$REPORT_FILE"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -10 >> "$REPORT_FILE"

# Display report
cat "$REPORT_FILE"

