#!/bin/bash

# Check if an argument was provided
if [ -z "$1" ]; then
    echo "Usage: $0 <target-host>"
    exit 1
fi

TARGET="$1"

echo "Running Nmap default script scan on: $TARGET"
echo "--------------------------------------------"

# Run Nmap with default scripts
sudo nmap -sC -sV "$TARGET"
