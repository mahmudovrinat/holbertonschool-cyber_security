#!/bin/bash
john --wordlist=rockyou.txt --format=Raw-SHA256 "$1" && john --show --format=Raw-SHA256 "$1" | awk -F: 'NR==1{print $2}' > 6-password.txt
