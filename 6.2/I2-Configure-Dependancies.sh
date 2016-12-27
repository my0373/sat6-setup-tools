#!/usr/bin/env bash
# 6.2 specific
SM="/usr/sbin/subscription-manager"
POOLID=""

# Register the RHEL host with RHN, and attach it to the correct pool using the id in ${POOLID}
$SM register --type=satellite
$SM attach --pool=${POOLID} 


