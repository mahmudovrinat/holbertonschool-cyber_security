#!/usr/bin/env bash

set -euo pipefail

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <wordlist1> <wordlist2>" >&2
  exit 2
fi

w1="$1"
w2="$2"
out="combined.txt"

if [ ! -f "$w1" ]; then
  echo "File not found: $w1" >&2
  exit 3
fi

if [ ! -f "$w2" ]; then
  echo "File not found: $w2" >&2
  exit 4
fi

if ! command -v hashcat >/dev/null 2>&1; then
  echo "hashcat not found in PATH" >&2
  exit 5
fi

# produce combinations (word1+word2) and save to combined.txt while printing to stdout
hashcat --stdout -a 1 "$w1" "$w2" | tee "$out"
