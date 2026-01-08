#!/bin/bash
BASE="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd ${BASE}
# echo ${BASE}

# this method works, but is not necessary as of 2026-01-01: the take-picture.sh script
# now directly uploads the new photo using scp .
rsync -av ./photos w982:/home/sassn/Projects/Sassnitz-zero2 >>push.log 2>>push-error.log
