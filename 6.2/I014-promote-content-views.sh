#!/bin/bash
ORG="ShadowLab"
CV_NAME="RHEL7-Base"
CV_ID=$(hammer --csv content-view list --organization=${ORG} | grep -i ${CV_NAME} | awk  -F, '{print $1} ')
CONTENT_VIEW_VERSION_ID=$(hammer --csv content-view version list  | grep ${CV_NAME} | awk -F, {' print $1 '} | sort | tail -1)
LIFECYCLE_IDS=$(hammer --csv lifecycle-environment list --organization=${ORG} | grep  ^[0-9] | awk -F, '{ print $1 }' | sort | tr '\n' ' ')

set -x
## promote the content view to the appropriate lifecycle ID.
for LIFECYCLE_ID in ${LIFECYCLE_IDS}
do
CMD="hammer content-view version promote --content-view-id=${CV_ID} --id=${CONTENT_VIEW_VERSION_ID} --to-lifecycle-environment-id=${LIFECYCLE_ID}"
$($CMD)
done
set +x
