#!/bin/bash
# sleep 38

BASE="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
LOG=${BASE}/wget-weather-out.log
ERRLOG=${BASE}/wget-weather-error.log
cd ${BASE}
source .urls

d=`./date-min-iso.sh`
# echo $d >>timestamp.log

# fetch weather in Sassnitz:
FILE=${BASE}/weather/sassnitz-$d.xml
URL=${WEATHER_URL}
wget -O $FILE $URL >> $LOG 2>> $ERRLOG
