#!/bin/bash
BASE="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd ${BASE}
# echo ${BASE}

d=`${BASE}/date-min-iso.sh`
echo $d >>timestamp.log
echo $d >>fswebcam.log

# let's take 2 "void" pictures, so the camera driver can adjust exposure (?)
fswebcam -d /dev/video0 -i 0 -p YUYV -r 2048x1536 --no-banner --jpeg 80 --save /dev/null 2>/dev/null
fswebcam -d /dev/video0 -i 0 -p YUYV -r 2048x1536 --no-banner --jpeg 80 --save /dev/null 2>/dev/null

TRGT=${BASE}/photos/$d.jpg
fswebcam -d /dev/video0 -i 0 -p YUYV -r 2048x1536 --no-banner --jpeg 80 --save $TRGT 2>>fswebcam.log

scp $TRGT w982:/home/sassn/Projects/Sassnitz-zero2/photos/ >>scp.log 2>>scp-error.log
