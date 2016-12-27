#!/bin/bash
##################################################################################
# Generates a config file for hammer that allows passwordless access for this user.
# WARNING: Your password and username will remain on the filesystem in plain text.
# Be certain this is what you want.
#
# Author: myork@redhat.com
##################################################################################

CAPSULE=$1

if [ $# -lt 1 ]
then
	echo "Usage: $0 [capsule-fqdn]"
	exit 1
fi

capsule-certs-generate --capsule-fqdn "$CAPSULE" --certs-tar "~/$CAPSULE-certs.tar"
