#!/bin/bash

BASE="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd ${BASE}

d=`${BASE}/date-hour-iso.sh`
# echo $d >>${TMPDIR}/each-hour-timestamp.log

TMPDIR=/mnt/ramdisk
CUTPIC_PATTERN=wattmeter-cut-${d}\*.jpg

# wait for all eventual picture processing of that hour to complete:
if [ -t 1 ] ; then
    echo "interactive mode, skipping sleep..."
else
    sleep 82
fi

# ls $TMPDIR/$CUTPIC_PATTERN
cd $TMPDIR
tar cf ${BASE}/primary-jpgs/$d.tar $CUTPIC_PATTERN >/dev/null 2>/dev/null
rm -f $CUTPIC_PATTERN
