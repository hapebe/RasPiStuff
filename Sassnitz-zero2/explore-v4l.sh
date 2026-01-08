#!/bin/bash

# FS Webcam can list the camera controls:
# fswebcam -d v4l2:/dev/video0 -i 0 --list-controls
#    -p YUYV -r 2048x1536 --no-banner

# v4l2-ctl can list controls:
v4l2-ctl -d /dev/video0 --list-ctrls
