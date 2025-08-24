#!/usr/bin/env zsh

LOG_FILE="/home/rexsybimatw/tablet-log.txt"
echo "Xiaomi tablet connected on $(/usr/bin/date)" >> "$LOG_FILE"
/usr/bin/adb start-server  # Ensure ADB is running
/usr/bin/adb reverse tcp:5900 tcp:5900 >> "$LOG_FILE" 2>&1
echo "reverse tcp:5900 success" >> "$LOG_FILE"
echo "reverse tcp:5900 success" 
