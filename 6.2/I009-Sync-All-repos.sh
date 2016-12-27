#!/usr/bin/bash

REPO_IDS=$(hammer repository list --organization "ShadowLab" | grep ^[0-9] | awk '{print $1}')
for ID in ${REPO_IDS}
do
set -x
	hammer repository synchronize --id=${ID}
set +x
done

	
