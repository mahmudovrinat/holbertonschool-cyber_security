#!/bin/bash

LOGFILE="./auth.log"

# Count unique IPs that successfully logged into the compromised account 'root'
grep "Accepted password for root" "$LOGFILE" \
    | awk '{for(i=1;i<=NF;i++) if ($i=="from") print $(i+1)}' \
    | sort -u \
    | wc -l
