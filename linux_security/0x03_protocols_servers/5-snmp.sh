#!/bin/bash
grep -Ei 'com2sec|rocommunity|rwcommunity|community' /etc/snmp/snmpd.conf 2>/dev/null | grep -i public
