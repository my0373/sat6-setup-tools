#!/usr/bin/env bash

# Install a manifest using 


MANIFEST=$1
ORG="ShadowLab"

set -x
hammer repository-set enable  --organization "${ORG}" \
 --product "Red Hat Enterprise Linux Server" \
 --name "Red Hat Enterprise Linux 7 Server (Kickstart)" \
 --releasever "7.3" --basearch "x86_64"

hammer repository-set enable  --organization "${ORG}" \
 --product "Red Hat Enterprise Linux Server" \
 --name "Red Hat Enterprise Linux 7 Server (RPMs)" \
 --releasever "7Server" --basearch "x86_64"

hammer repository-set enable  --organization "${ORG}"  \
 --product "Red Hat Enterprise Linux Server"  \
 --name "Red Hat Satellite Tools 6.2 (for RHEL 7 Server) (RPMs)" \
 --basearch "x86_64"

hammer repository-set enable  --organization "${ORG}" \
 --product "Red Hat Enterprise Linux Server" \
 --name "Red Hat Enterprise Linux 7 Server - RH Common (RPMs)" \
 --releasever "7Server" --basearch "x86_64"

hammer repository-set enable --organization "${ORG}" \
  --product "Red Hat Enterprise Linux Atomic Host" \
  --name "Red Hat Enterprise Linux Atomic Host (Kickstart)" 

hammer repository-set enable --organization "${ORG}" \
  --product "Red Hat Enterprise Linux Atomic Host" \
  --name "Red Hat Enterprise Linux Atomic Host (Images)" 
set +x
