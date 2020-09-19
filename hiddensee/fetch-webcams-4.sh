sleep 30
cd /home/pi/hiddensee
source .urls
d=`./date-min-iso.sh`
echo $d >>timestamp.log
wget -O hafen-r/vitte-hafen-r-$d.jpg ${VITTE_HAFEN_R}
wget -O hafen-l/vitte-hafen-l-$d.jpg ${VITTE_HAFEN_L}
