#!/bin/bash
sleep 39

BASE="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
LOG=${BASE}/wget-out.log
ERRLOG=${BASE}/wget-error.log

timestamp=$(date +"%s")501
d=`${BASE}/date-min-iso.sh`

cd ${BASE}
source .urls
TRGT=${BASE}/ship-data/ships-$d.json

wget --no-check-certificate -O $TRGT $SHIPS_POS_URL >> $LOG 2>> $ERRLOG
