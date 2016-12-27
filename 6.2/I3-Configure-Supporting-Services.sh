#!/usr/bin/env bash

# 6.2 specific
YUM="/usr/bin/yum"

$YUM install ntp ntpdate
systemctl stop ntpd
cp /etc/ntp.conf /etc/ntp.conf.orig
cat /etc/ntp.conf | sed 's/^server.*/server 192.168.100.2/' | grep -v "^#" | sort -u > /etc/ntp.conf.new
cp /etc/ntp.conf.new /etc/ntp.conf
ntpdate 192.168.100.2
systemctl start ntpd
ntpq -p
