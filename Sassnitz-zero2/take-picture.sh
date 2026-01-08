#!/bin/bash
BASE="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd ${BASE}
# echo ${BASE}

d=`${BASE}/date-min-iso.sh`
echo $d >>timestamp.log
echo $d >>fswebcam.log

# take a night mode picture:
v4l2-ctl -d /dev/video0 --set-ctrl auto_exposure=1
v4l2-ctl -d /dev/video0 --set-ctrl exposure_time_absolute=5000
v4l2-ctl -d /dev/video0 --list-ctrls-menus > /dev/null
sleep 0.2
TRGT=${BASE}/photos/$d-e5k.jpg
fswebcam -d /dev/video0 -i 0 -p YUYV -r 2048x1536 --no-banner --jpeg 80 --save /dev/null 2>>fswebcam.log
fswebcam -d /dev/video0 -i 0 -p YUYV -F 5 -r 2048x1536 --no-banner --jpeg 80 --save $TRGT 2>>fswebcam.log
# -S 4 means: skip (take & discard) 4 pictures

# exposure time 500:
v4l2-ctl -d /dev/video0 --set-ctrl exposure_time_absolute=500
sleep 0.2
TRGT=${BASE}/photos/$d-e500.jpg
fswebcam -d /dev/video0 -i 0 -p YUYV -r 2048x1536 --no-banner --jpeg 80 --save /dev/null 2>>fswebcam.log
fswebcam -d /dev/video0 -i 0 -p YUYV -r 2048x1536 --no-banner --jpeg 80 --save $TRGT 2>>fswebcam.log

# exposure time 125:
v4l2-ctl -d /dev/video0 --set-ctrl exposure_time_absolute=125
sleep 0.2
TRGT=${BASE}/photos/$d-e125.jpg
fswebcam -d /dev/video0 -i 0 -p YUYV -r 2048x1536 --no-banner --jpeg 80 --save /dev/null 2>>fswebcam.log
fswebcam -d /dev/video0 -i 0 -p YUYV -r 2048x1536 --no-banner --jpeg 80 --save $TRGT 2>>fswebcam.log

# exposure time 30:
v4l2-ctl -d /dev/video0 --set-ctrl exposure_time_absolute=30
sleep 0.2
TRGT=${BASE}/photos/$d-e030.jpg
fswebcam -d /dev/video0 -i 0 -p YUYV -r 2048x1536 --no-banner --jpeg 80 --save /dev/null 2>>fswebcam.log
fswebcam -d /dev/video0 -i 0 -p YUYV -r 2048x1536 --no-banner --jpeg 80 --save $TRGT 2>>fswebcam.log

# exposure time 8:
v4l2-ctl -d /dev/video0 --set-ctrl exposure_time_absolute=8
sleep 0.2
TRGT=${BASE}/photos/$d-e008.jpg
fswebcam -d /dev/video0 -i 0 -p YUYV -r 2048x1536 --no-banner --jpeg 80 --save /dev/null 2>>fswebcam.log
fswebcam -d /dev/video0 -i 0 -p YUYV -r 2048x1536 --no-banner --jpeg 80 --save $TRGT 2>>fswebcam.log

# exposure time 1:
v4l2-ctl -d /dev/video0 --set-ctrl exposure_time_absolute=1
sleep 0.2
TRGT=${BASE}/photos/$d-e001.jpg
fswebcam -d /dev/video0 -i 0 -p YUYV -r 2048x1536 --no-banner --jpeg 80 --save /dev/null 2>>fswebcam.log
fswebcam -d /dev/video0 -i 0 -p YUYV -r 2048x1536 --no-banner --jpeg 80 --save $TRGT 2>>fswebcam.log


TRGT=${BASE}/photos/$d
# echo ${TRGT}
scp ${TRGT}*.jpg w982:/home/sassn/Projects/Sassnitz-zero2/photos/ >>scp.log 2>>scp-error.log
