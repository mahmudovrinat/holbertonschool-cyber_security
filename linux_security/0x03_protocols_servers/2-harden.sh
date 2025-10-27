#!/bin/bash
find / -type d -perm -0002 ! -path "/proc/*" ! -path "/sys/*" ! -path "/run/*" 2>/dev/null -exec echo {} \; -exec chmod o-w {} \;
