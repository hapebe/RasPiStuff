#!/bin/bash
OUTFILE=raspistill.jpg
if [ $# -gt 1 ] ; then
	OUTFILE=$1
	echo "Using $OUTFILE as outfile."
fi
raspistill -t 1000 -n -md 4 -hf -vf -w 1296 -h 972 -o $OUTFILE
