#!/bin/bash
BASE="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd ${BASE}
# echo ${BASE}

# push all code (?) to the remove end, omitting pictures, libraries and log files
rsync -av --exclude "**/*.jpg" \
   --exclude "dht11-on-pi/env" \
   --exclude "lgpio" \
   --exclude "**/*.log" \
   ./ w982:/home/sassn/Projects/Sassnitz-zero2
# >>push.log 2>>push-error.log
