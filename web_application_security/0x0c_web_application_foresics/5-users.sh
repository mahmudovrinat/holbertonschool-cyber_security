#!/bin/bash

LOG="./auth.log"

# Extract usernames from "user added" or "new account" lines
grep -Ei "new user|adduser|created" "$LOG" \
    | awk '{for(i=1;i<=NF;i++) if ($i=="user" || $i=="account") print $(i+1)}' \
    | sort -u \
    | paste -sd ',' -
