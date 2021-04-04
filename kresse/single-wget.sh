#!/bin/bash
if [ $# -lt 2 ] ; then
	>&2 echo "Usage $0 <JPEG URL> <JPEG target filename>"
	exit 1
fi

SRCURL=$1
TRGT=$2
# echo $SRCURL
# echo $TRGT
# exit


BASE="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
LOG=${BASE}/wget-out.log
ERRLOG=${BASE}/wget-error.log
cd ${BASE}

d=`./date-min-iso.sh`

wget --no-check-certificate -O $TRGT $SRCURL >> $LOG 2>> $ERRLOG
# is it okay?
jpeginfo -c $TRGT
if [ $? -ne 0 ]; then
	# oops - repeat!
	rm $TRGT
	sleep 15
	wget --no-check-certificate -O $TRGT $SRCURL >> $LOG 2>> $ERRLOG
fi
