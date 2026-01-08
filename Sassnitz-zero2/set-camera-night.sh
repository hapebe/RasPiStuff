#!/bin/bash
v4l2-ctl -d /dev/video0 --set-ctrl auto_exposure=1
v4l2-ctl -d /dev/video0 --set-ctrl exposure_time_absolute=5000
# v4l2-ctl -d /dev/video0 --list-ctrls
v4l2-ctl -d /dev/video0 --list-ctrls-menus
