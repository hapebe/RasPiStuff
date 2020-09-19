#!/bin/bash
FILENAME=`./latest-feodora.sh`
echo -n "Filename: $FILENAME"
echo ""
jp2a --colors $FILENAME
