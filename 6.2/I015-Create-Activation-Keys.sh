#!/bin/bash
ORG="ShadowLab"
CV_NAME="RHEL7-Base"
AK1="RHEL7-Production"
LIFECYCLE="Production"
RELEASE_VER="7Server"

hammer activation-key create --name "${AK1}" \
 --content-view "${CV_NAME}" --lifecycle-environment ${LIFECYCLE}  \
 --organization "${ORG}"

hammer activation-key update --release-version ${RELEASE_VER}  \
 --organization "${ORG}" --name "${AK1}"

hammer activation-key update --auto-attach true  \
 --organization "${ORG}" --name "${AK1}"

SUBS=$(hammer --csv subscription list --organization ${ORG} | grep ^[0-9] | awk -F, '{print $1}' | tr '\n' ' ')
AKID=$(hammer --csv activation-key list --organization ${ORG} | grep ${AK1} | awk -F, '{ print $1 }')

for SUB in ${SUBS}
do
set -x
	hammer activation-key add-subscription --id ${AKID} --subscription-id ${SUB}
set +x
done
