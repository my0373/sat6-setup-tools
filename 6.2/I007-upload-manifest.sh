#!/usr/bin/env bash

# Install a manifest using 


MANIFEST=$1
ORG="ShadowLab"

if [ $# -lt 1 ]
then
    echo "Usage: $0 [manifest file] "
    exit 1
fi


set -x
hammer subscription upload --file $MANIFEST --organization ${ORG}
set +x

