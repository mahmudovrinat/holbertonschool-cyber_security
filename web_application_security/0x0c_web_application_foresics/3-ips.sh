#!/bin/bash

LOGFILE="./auth.log"

# Count unique IPs that succeeded
grep "Accepted password" "$LOGFILE" \
    | awk '{for(i=1;i<=NF;i++) if ($i=="from") print $(i+1)}' \
    | sort -u \
    | wc -l
