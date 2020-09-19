#!/bin/bash
sleep 8

BASE="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
LOG=${BASE}/wget-out.log
ERRLOG=${BASE}/wget-error.log
cd ${BASE}
source .urls

d=`./date-min-iso.sh`
echo $d >>timestamp.log


# fetch Villa Feodora image:
FEO=${BASE}/feodora/feodora-$d.jpg
FEOURL=${FEODORA}
wget --no-check-certificate -O $FEO $FEOURL >> $LOG 2>> $ERRLOG
# is it okay?
jpeginfo -c $FEO
if [ $? -ne 0 ]; then
	# oops - repeat!
	rm $FEO
	sleep 5
	wget --no-check-certificate -O $FEO $FEOURL >> $LOG 2>> $ERRLOG
fi

# sleep 2
#
# fetch Trelleborg Hamn Live Image:
# wget \
#	-O ${BASE}/trelleborg/trelleborg-$d.jpg \
#	${TRELLEBORG} \
#	>> $LOG 2>> $ERRLOG
#

sleep 3

# Oresund East:
FILE=${BASE}/oresund-e/o-e-$d.jpg
URL=${ORESUND_E}
wget --no-check-certificate -O $FILE $URL >> $LOG 2>> $ERRLOG
# is it okay?
jpeginfo -c $FILE
if [ $? -ne 0 ]; then
	# oops - repeat!
	rm $FILE
	sleep 2
	wget --no-check-certificate -O $FILE $URL >> $LOG 2>> $ERRLOG
fi

sleep 2

# Oresund West:
FILE=${BASE}/oresund-w/o-w-$d.jpg
URL=${ORESUND_W}
wget --no-check-certificate -O $FILE $URL >> $LOG 2>> $ERRLOG
# is it okay?
jpeginfo -c $FILE
if [ $? -ne 0 ]; then
	# oops - repeat!
	rm $FILE
	sleep 2
	wget --no-check-certificate -O $FILE $URL >> $LOG 2>> $ERRLOG
fi
