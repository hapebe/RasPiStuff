#!/bin/bash
FILENAME=`./latest-feodora.sh`
echo "Filename: $FILENAME"
eog $FILENAME &
