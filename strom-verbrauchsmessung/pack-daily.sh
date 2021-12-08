#!/bin/bash

# der Monat ist hier fest voreingestellt, ggf. bearbeiten:
month=2021-12

if [ $# -lt 1 ] ; then
	echo "usage: $0 <day of month> (${month}-..-*)"
	exit 1
fi
day=$1

# das Skript läuft fest in seinem eigenen Verzeichnis:
BASE="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd ${BASE}

imagePattern=wattmeter-cut-$month-$day\*.jpg
nSources=0

cd ${BASE}/primary-jpgs

# entpacke alle stündlichen tars:
for hour in {00..23} ; do
	hourArchive=./${month}-${day}-$hour.tar
	if [ -f $hourArchive ] ; then
		nSources=$((nSources + 1))
		echo "$hourArchive exists."
		tar xf $hourArchive
	fi
done

if [ $nSources -lt 1 ] ; then
	echo "Es gibt keine stündlichen Archive... ?"
	exit 1
fi

# create one archive for the whole day:
dailyTar=./$month-$day.tar
tar cf $dailyTar $imagePattern
mv ./$dailyTar ../daily-tars/

# delete temp jpgs:
rm $imagePattern

# und, schwerwiegender - lösche die stündlichen tars:
for hour in {00..23} ; do
	hourArchive=./${month}-${day}-$hour.tar
	if [ -f $hourArchive ] ; then
		rm $hourArchive
	fi
done


cd ${BASE}

