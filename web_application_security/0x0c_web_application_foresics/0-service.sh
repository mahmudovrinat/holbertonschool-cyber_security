#!/bin/bash

LOGFILE="./auth.log"

# If the file doesn't exist, just continue (do NOT exit with error)
if [ ! -f "$LOGFILE" ]; then
    echo "auth.log file not found in current directory"
    exit 0
fi

# Extract which service was used (SSH) by showing auth-related entries
grep -i "ssh" "$LOGFILE" \
    | awk '{print $5}' \
    | sed 's/pam_unix(//' | sed 's/):.*//' \
    | sort \
    | uniq -c \
    | sort -nr
