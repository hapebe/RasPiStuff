#!/bin/bash
OUTFILE=raspistill.jpg
if [ $# -gt 0 ] ; then
	OUTFILE=$1
	echo "Using $OUTFILE as outfile."
fi
raspistill -t 1000 -n -md 4 -w 648 -h 486 -o $OUTFILE
# raspistill -t 1000 -n -md 4 -w 1296 -h 972 -o $OUTFILE
# -hf -vf
