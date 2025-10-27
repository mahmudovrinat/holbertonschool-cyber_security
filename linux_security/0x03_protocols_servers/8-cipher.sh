#!/bin/bash
sudo nmap -sV --script ssl-enum-ciphers -p 443 "$1"
