#!/bin/bash
hashcat -m 0 -a 0 "$1" /usr/share/wordlists/rockyou.txt && hashcat -m 0 --show "$1" | awk -F: 'NR==1{print $2}' > 7-password.txt
