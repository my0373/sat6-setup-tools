#!/usr/bin/bash

ORG="ShadowLab"
hammer lifecycle-environment create --name "Development" \
--description "Development environment" --organization "${ORG}" \
--prior "Library"

hammer lifecycle-environment create --name "Production" \
--description "Production environment" --organization "${ORG}" \
--prior "Development"
