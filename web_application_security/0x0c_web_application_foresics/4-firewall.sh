#!/bin/bash

LOGFILE="./auth.log"

# Count all firewall rule additions
grep -Ei "firewall|iptables" "$LOGFILE" \
    | grep -Ei "add|added|insert|append" \
    | wc -l
