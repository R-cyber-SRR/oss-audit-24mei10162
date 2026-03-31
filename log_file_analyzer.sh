#!/bin/bash
# Script 4: Log File Analyzer
# Author: ROHITH | Course: Open Source Software
# Usage: ./log_analyzer.sh /var/log/syslog error
# Purpose: Counts keyword occurrences in a log file
 
LOGFILE=$1                   # First argument: path to log file
KEYWORD=${2:-"error"}        # Second argument (default: error)
COUNT=0                      # Counter
 
# --- Validate file ---
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File [$LOGFILE] not found."
    exit 1
fi
 
if [ ! -s "$LOGFILE" ]; then
    echo "Warning: File [$LOGFILE] is empty."
    exit 0
fi
 
echo "Analyzing : $LOGFILE"
echo "Keyword   : $KEYWORD"
echo "-------------------------------------------"
 
# --- Read file line by line ---
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"
 
echo "Keyword '$KEYWORD' found $COUNT time(s) in $LOGFILE"
echo ""
echo "Last 5 matching lines:"
echo "-------------------------------------------"
grep -i "$KEYWORD" "$LOGFILE" | tail -5
