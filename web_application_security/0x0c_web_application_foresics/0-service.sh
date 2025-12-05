#!/bin/bash

# Default log file (can be changed or passed as argument)
LOGFILE="/var/log/auth.log"

# If user passes a file as argument, use it
if [ -n "$1" ]; then
    LOGFILE="$1"
fi

# Check file existence
if [ ! -f "$LOGFILE" ]; then
    echo "Log file not found: $LOGFILE"
    exit 1
fi

# Extract all services used in authentication lines
# Clean and sort them to show frequency
grep -E "pam_unix|sshd" "$LOGFILE" \
    | awk '{print $1, $2, $3, $4, $5}' \
    | sed 's/.*pam_unix(//' \
    | sed 's/):.*//' \
    | sort \
    | uniq -c \
    | sort -nr
