#!/bin/bash

LOG="./auth.log"

grep -E "useradd|new user|added user|created user" "$LOG" \
    | sed -E 's/.*name=([^,]*).*/\1/; s/.*user `([^`]*)`.*/\1/; s/.*user ([A-Za-z0-9_-]+).*/\1/' \
    | sort -u \
    | paste -sd ',' -
