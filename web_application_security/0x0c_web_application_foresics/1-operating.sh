#!/bin/bash

# The local file is named 'dmesg' (not /var/log/dmesg)
FILE="./dmesg"

if [ -f "$FILE" ]; then
    grep -i "Linux version" "$FILE"
fi
