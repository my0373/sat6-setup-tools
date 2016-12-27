#!/usr/bin/env bash

# 6.2 specific
SM="/usr/sbin/subscription-manager"
YUM="/usr/bin/yum"

$SM repos --disable="*"
$SM repos --enable=rhel-7-server-rpms --enable=rhel-server-rhscl-7-rpms --enable=rhel-7-server-satellite-6.2-rpms
$YUM clean all
$YUM update -y 
echo "It may worth rebooting now if you have installed a new kernel."
