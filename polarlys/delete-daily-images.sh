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

year=2020
rm pos1/polarlys-pos1-${year}-${1}-*.jpg
rm pos2/polarlys-pos2-${year}-${1}-*.jpg
rm finnmarken1/finnmarken-pos1-${year}-${1}-*.jpg
rm finnmarken2/finnmarken-pos2-${year}-${1}-*.jpg
