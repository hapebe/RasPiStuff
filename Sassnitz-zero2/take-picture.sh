#!/bin/bash

# Takes a series of 6 (?) webcam pictures, each with manual exposure setting,
# writing to a mktemp-Folder.
# The best (evaluation script!) of these pictures is than stored in the local fs,
# and sent to a remote partner via SCP.

BASE="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd ${BASE}
# echo ${BASE}

d=`${BASE}/date-min-iso.sh`
echo $d >>timestamp.log
echo $d >>fswebcam.log

TMPOUT=$(mktemp -d)
# echo $TMPOUT


# take a night mode picture:
v4l2-ctl -d /dev/video0 --set-ctrl auto_exposure=1
v4l2-ctl -d /dev/video0 --set-ctrl exposure_time_absolute=5000
v4l2-ctl -d /dev/video0 --list-ctrls-menus > /dev/null
sleep 0.2
TRGT=${TMPOUT}/$d-e5k.jpg
fswebcam -d /dev/video0 -i 0 -p YUYV -r 2048x1536 --no-banner --jpeg 80 --save /dev/null 2>>fswebcam.log
fswebcam -d /dev/video0 -i 0 -p YUYV -F 5 -r 2048x1536 --no-banner --jpeg 80 --save $TRGT 2>>fswebcam.log
# -S 4 means: skip (take & discard) 4 pictures

# exposure time 500:
v4l2-ctl -d /dev/video0 --set-ctrl exposure_time_absolute=500
sleep 0.2
TRGT=${TMPOUT}/$d-e500.jpg
fswebcam -d /dev/video0 -i 0 -p YUYV -r 2048x1536 --no-banner --jpeg 80 --save /dev/null 2>>fswebcam.log
fswebcam -d /dev/video0 -i 0 -p YUYV -r 2048x1536 --no-banner --jpeg 80 --save $TRGT 2>>fswebcam.log

# exposure time 125:
v4l2-ctl -d /dev/video0 --set-ctrl exposure_time_absolute=125
sleep 0.2
TRGT=${TMPOUT}/$d-e125.jpg
fswebcam -d /dev/video0 -i 0 -p YUYV -r 2048x1536 --no-banner --jpeg 80 --save /dev/null 2>>fswebcam.log
fswebcam -d /dev/video0 -i 0 -p YUYV -r 2048x1536 --no-banner --jpeg 80 --save $TRGT 2>>fswebcam.log

# exposure time 30:
v4l2-ctl -d /dev/video0 --set-ctrl exposure_time_absolute=30
sleep 0.2
TRGT=${TMPOUT}/$d-e030.jpg
fswebcam -d /dev/video0 -i 0 -p YUYV -r 2048x1536 --no-banner --jpeg 80 --save /dev/null 2>>fswebcam.log
fswebcam -d /dev/video0 -i 0 -p YUYV -r 2048x1536 --no-banner --jpeg 80 --save $TRGT 2>>fswebcam.log

# exposure time 8:
v4l2-ctl -d /dev/video0 --set-ctrl exposure_time_absolute=8
sleep 0.2
TRGT=${TMPOUT}/$d-e008.jpg
fswebcam -d /dev/video0 -i 0 -p YUYV -r 2048x1536 --no-banner --jpeg 80 --save /dev/null 2>>fswebcam.log
fswebcam -d /dev/video0 -i 0 -p YUYV -r 2048x1536 --no-banner --jpeg 80 --save $TRGT 2>>fswebcam.log

# exposure time 1:
v4l2-ctl -d /dev/video0 --set-ctrl exposure_time_absolute=1
sleep 0.2
TRGT=${TMPOUT}/$d-e001.jpg
fswebcam -d /dev/video0 -i 0 -p YUYV -r 2048x1536 --no-banner --jpeg 80 --save /dev/null 2>>fswebcam.log
fswebcam -d /dev/video0 -i 0 -p YUYV -r 2048x1536 --no-banner --jpeg 80 --save $TRGT 2>>fswebcam.log


# ${BASE}/sort-pictures-by-lum.sh ${TMPOUT}/*.jpg >>sort-pictures.log

# have the files in TMPOUT sorted by their weight; the return value is the filename that shall prevail:
# ls ${TMPOUT}/*.jpg
WINNER=$(./choose-best-picture.sh ${TMPOUT}/*.jpg)
# echo "Winner: $WINNER"

# this TRGT is the pure directory name, with a trailing slash:
TRGT=${BASE}/photos/
# echo "cp $WINNER $TRGT"
cp $WINNER $TRGT

# delete our TEMP directory and the remaining photos:
rm -rf $TMPOUT


TRGT=${BASE}/photos/$d
# echo ${TRGT}
scp ${TRGT}*.jpg w982:/home/sassn/Projects/Sassnitz-zero2/photos/ >>scp.log 2>>scp-error.log
# echo "scp finished..."