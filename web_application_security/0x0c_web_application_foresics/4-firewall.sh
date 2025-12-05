#!/bin/bash

LOGFILE="./auth.log"

grep -Ei "rule" "$LOGFILE" | grep -Ei "add" | wc -l
