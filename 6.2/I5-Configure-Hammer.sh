#!/bin/bash
##################################################################################
# Generates a config file for hammer that allows passwordless access for this user.
# WARNING: Your password and username will remain on the filesystem in plain text.
# Be certain this is what you want.
#
# Author: myork@redhat.com
##################################################################################

SATELLITE_ADMIN_USER=$1
SATELLITE_ADMIN_PASS=$2
HAMMER_CONFIG_DIR="/root/.hammer/"
HAMMER_CONFIG_FILE="cli_config.yml"
HAMMER_CONFIG_FILE_PERMS="600"

if [ $# -lt 2 ]
then
	echo "Usage: create-hammer-cli-config.sh [Admin Username] [Admin Password]"
	exit 1
fi

## Create the .hammer directory that hammer looks for.
mkdir -p ~/.hammer
cat > ${HAMMER_CONFIG_DIR}${HAMMER_CONFIG_FILE}<<EOF
:ui:
    :interactive: true
    :per_page: 200
    :history_file:  '${HAMMER_CONFIG_DIR}history'
:foreman:
    :username: '${SATELLITE_ADMIN_USER}'
    :password: '${SATELLITE_ADMIN_PASS}'
EOF
