#!/bin/bash

LOGFILE="./auth.log"

# Use last 1000 lines only
LAST_LOGS=$(tail -n 1000 "$LOGFILE")

# Find users with failed attempts
FAILED_USERS=$(echo "$LAST_LOGS" | grep "Failed password" | awk '{print $9}' | sort | uniq)

# For each failed user, check if they later succeeded
for user in $FAILED_USERS; do
    SUCCESS=$(echo "$LAST_LOGS" | grep "Accepted password" | grep " $user " )
    if [ -n "$SUCCESS" ]; then
        echo "$user"
        exit 0
    fi
done

exit 0
