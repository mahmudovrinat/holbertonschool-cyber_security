#!/bin/bash
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -p tcp --dport ssh -j ACCEPT && iptables -A INPUT -j DROP
