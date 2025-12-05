#!/bin/bash

LOG="./auth.log"

# Match *any* firewall-related additions
grep -Ei "ufw|firewall|iptables|rule" "$LOG" | grep -Ei "add|added|insert|append|allow" | wc -l
