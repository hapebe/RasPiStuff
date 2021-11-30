#!/bin/bash

# sleep 22

BASE="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd ${BASE}

d=`${BASE}/date-min-iso.sh`
echo $d >>each-minute-timestamp.log

TRGT=${BASE}/primary-jpgs/wattmeter-$d.jpg

# actually take a photo:
raspistill -t 1000 -n -md 4 -w 1296 -h 972 -o $TRGT
# -hf -vf # horizontal/vertical flip
# -md # mode 4 = 2x2 pixel binning, resulting in a 1296x972 bitmap
