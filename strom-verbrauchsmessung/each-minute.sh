#!/bin/bash

# sleep 22

BASE="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd ${BASE}

TMPDIR=/mnt/ramdisk

d=`${BASE}/date-minute-iso.sh`
echo $d >>${TMPDIR}/each-minute-timestamp.log

CAMPIC=${TMPDIR}/wattmeter-$d.jpg
CUTPIC=${TMPDIR}/wattmeter-cut-$d.jpg


./take-picture.sh $CAMPIC


./rotate-and-cut.sh $CAMPIC $CUTPIC


# for actual long-time use, we don't want to keep the original pic:
rm $CAMPIC
