#!/bin/bash
# Script: 0-whois.sh
# Usage: ./0-whois.sh <domain>
# Description: Run whois and extract Registrant, Admin, and Tech info into CSV.

if [ -z "$1" ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

domain="$1"
outfile="${domain}.csv"

whois "$domain" | awk -F': ' '
/^Registrant|^Admin|^Tech/ {
    gsub(/ /, "$", $1)   # Replace spaces in keys with $
    gsub(/^ +| +$/, "", $2) # Trim spaces
    print $1 "," $2
}' > "$outfile"
