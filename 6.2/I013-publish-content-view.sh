#!/usr/bin/bash

ORG="ShadowLab"
CV1="RHEL7-Base" 

#Publish the content view
hammer content-view publish --name "${CV1}" \
--organization "${ORG}"
