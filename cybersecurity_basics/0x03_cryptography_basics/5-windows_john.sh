#!/bin/bash
cp "$1" window.txt && john --wordlist=rockyou --format=NT window.txt && john --show --format=NT window.txt | awk -F: 'NR==1{print $2}' > 5-password.txt
