#!/usr/bin/env bash

# 6.2 specific
SM="/usr/sbin/subscription-manager"
YUM="/usr/bin/yum"
DHCP_RANGE="192.168.100.200 192.168.100.220" 
ORG="ShadowLab"
LOCATION="Laptop"
USERNAME="admin"
PASSWORD="redhat"

$YUM install -y satellite

set -x
satellite-installer --scenario=satellite  \
--foreman-admin-username $USERNAME  \
--foreman-admin-password $PASSWORD  \
--foreman-proxy-dhcp	true  \
--foreman-proxy-dhcp-interface enp0s3  \
--foreman-proxy-dhcp-gateway 192.168.100.5  \
--foreman-proxy-dhcp-range "$DHCP_RANGE"  \
--foreman-proxy-dns false  \
--foreman-proxy-tftp true  \
--foreman-initial-organization $ORG  \
--foreman-initial-location $LOCATION  \
--enable-foreman-plugin-openscap  \
--foreman-plugin-openscap-configure-openscap-repo \
--katello-enable-ostree=true
set +x


