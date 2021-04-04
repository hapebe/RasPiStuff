#!/bin/bash
FILENAME=`./latest-photo.sh`
echo -n "Filename: $FILENAME"
echo ""
jp2a --colors $FILENAME
