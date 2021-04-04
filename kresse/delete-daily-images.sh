#!/bin/bash
#
# you can / should call this once per day,
# *AFTER* the original images have been copied
# to the slave / volume storage!
#
if [[ $# -lt 1 ]] ; then
	echo "Usage: ${0} <month (two-digit)>"
	exit 1
fi

year=2021
rm photos/kresse-${year}-${1}-*.jpg
