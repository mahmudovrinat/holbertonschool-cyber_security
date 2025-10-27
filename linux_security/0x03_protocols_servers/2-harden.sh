#!/bin/bash
find / -type d -perm -0002 ! -path "/proc/*" ! -path "/sys/*" ! -path "/run/*" 2>/dev/null -print -exec chmod o-w {} \;
