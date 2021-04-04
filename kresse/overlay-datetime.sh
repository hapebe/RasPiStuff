#!/bin/bash
if [ $# -lt 2 ] ; then
	>&2 echo "Usage $0 <JPEG source> <JPEG target>"
	exit 1
fi

SRC=$1
TRGT=$2
# echo $SRC ; echo $TRGT ; exit

BASE="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
t=`${BASE}/date-min-human.sh`
meteo=`${BASE}/weather.py`

width=`identify -format %w ${SRC}`
convert -background '#0006' -fill '#ccc' \
	-gravity center -size ${width}x30 \
        caption:"${t}${meteo}" \
        ${SRC} +swap -gravity south -composite \
	${TRGT}
