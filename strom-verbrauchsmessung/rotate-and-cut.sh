#!/bin/bash

# imagemagickInstalled=$(dpkg -l | grep imagemagick | wc -l)
# if [[ $imagemagickInstalled -lt 1 ]]; then
#	echo "You must install the imagemagick package before using this script."
#	exit 1
# fi

if [ $# -lt 2 ] ; then
        >&2 echo "Usage $0 <input file> <JPEG target filename>"
        exit 1
fi

SRC=$1
TRGT=$2

# just for debug purposes:
# cp /mnt/ramdisk/$SRC .

# the processing happens in the ram disk!
cd /mnt/ramdisk

convert $SRC -auto-level -auto-gamma -rotate -2.2 - | convert - -crop 408x80+11+156 $TRGT
# /home/pi/strom-verbrauchsmessung/tmp.jpg
# - | convert - -crop 408x80+8+158 $TRGT
# | convert - -crop 472x88+48+143 $TRGT
# convert $SRC -auto-level -auto-gamma -rotate -2.6 - | convert - -crop 936x184+94+282 $TRGT
#
