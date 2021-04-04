#!/bin/bash

imagemagickInstalled=$(dpkg -l | grep imagemagick | wc -l)
if [[ $imagemagickInstalled -lt 1 ]]; then
	echo "You must install the imagemagick package before using this script."
	exit 1
fi


sleep 22

BASE="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd ${BASE}
source .urls

d=`${BASE}/date-min-iso.sh`
echo $d >>timestamp.log

meteo=`${BASE}/weather.py`

# focus the camera:
wget -O /dev/null $FOCUSURL > /dev/null 2> /dev/null

ORIG=${BASE}/photos/kresse.jpg
TRGT=${BASE}/photos/kresse-$d.jpg

# fetch IP Webcam image from Samsung Galaxy S4 mini:
rm ${ORIG}
${BASE}/single-wget.sh $KRESSEURL $ORIG

# overlay date and time (using ImageMagick):
${BASE}/overlay-datetime.sh ${ORIG} ${TRGT}

rm /var/www/vhosts/myfritz/http/kresse/current.jpg
cp $TRGT /var/www/vhosts/myfritz/http/kresse/current.jpg
