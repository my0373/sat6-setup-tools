#!/usr/bin/bash

ORG="ShadowLab"
set -x
# Ok, this isn't pretty, but it works for now until I have time to come back and fix it.
#TODO: Make this less ugly and complex.
RHEL7_REPOS=$(hammer repository list --organization=${ORG} | egrep -i "Red\ Hat\ Enterprise\ Linux\ 7|Red\ Hat\ Satellite\ Tools\ 6.2" | awk '{ print $1}' | tr -s ' ' | cut -d ' ' -f 2 | tr '\n' ',' | sed 's/,$//')
set +x
CV1="RHEL7-Base" 

#Create the content view
hammer content-view create --name ${CV1} \
 --description "RHEL7 Base CV " \
 --organization "${ORG}"

hammer content-view update --repository-ids ${RHEL7_REPOS} \
 --name "${CV1}" --organization "${ORG}"
