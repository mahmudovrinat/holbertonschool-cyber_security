#!/bin/bash
hashcat -m 0 -a 1 "$1" wordlist1.txt wordlist2.txt && hashcat -m 0 --show "$1" | awk -F: 'NR==1{print $2}' > 9-password.txt
