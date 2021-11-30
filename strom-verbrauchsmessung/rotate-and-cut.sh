#!/bin/bash

imagemagickInstalled=$(dpkg -l | grep imagemagick | wc -l)
if [[ $imagemagickInstalled -lt 1 ]]; then
	echo "You must install the imagemagick package before using this script."
	exit 1
fi

if [ $# -lt 2 ] ; then
        >&2 echo "Usage $0 <input file> <JPEG target filename>"
        exit 1
fi

SRC=$1
TRGT=$2

convert $SRC -auto-level -auto-gamma -rotate 88 tmp.jpg
convert tmp.jpg -crop 280x84+354+597 $TRGT

#
