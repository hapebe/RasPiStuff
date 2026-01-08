#!/bin/bash

BASE="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd ${BASE} # ; echo $BASE

DATETIME=$(./date-min-iso.sh)
# echo $DATETIME

DHT11=$(source env/bin/activate ; ./read-data.py 2>/dev/null)
# echo $DHT11

printf "$DATETIME\t$DHT11\n" >> ./data.log
