#!/bin/bash

sleep 8

BASE="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd ${BASE}
source .urls

d=`${BASE}/date-min-iso.sh`
echo $d >>timestamp.log

# Finnmarken:
# fetch Finnmarken pos1 image:
TRGT=${BASE}/finnmarken1/finnmarken-pos1-$d.jpg
${BASE}/single-wget.sh $FM1URL $TRGT

# fetch Finnmarken pos2 image:
TRGT=${BASE}/finnmarken2/finnmarken-pos2-$d.jpg
SRCURL=${BASEURL}/hruten_msfinnmarken_pos2.jpg
${BASE}/single-wget.sh $FM2URL $TRGT


# Polarlys:
# fetch Polarlys pos1 image:
TRGT=${BASE}/pos1/polarlys-pos1-$d.jpg
${BASE}/single-wget.sh $PL1URL $TRGT

# fetch Polarlys pos2 image:
TRGT=${BASE}/pos2/polarlys-pos2-$d.jpg
${BASE}/single-wget.sh $PL2URL $TRGT
