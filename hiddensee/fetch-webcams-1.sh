sleep 10
cd /home/pi/hiddensee
source .urls
d=`./date-min-iso.sh`
echo $d >>timestamp.log
wget -O heringsdorf/wassersport-$d.jpg ${HERINGSDORF}
# wget -O tylosand/stranden-$d.jpg ${TYLOSAND}
