sleep 60
cd /home/pi/hiddensee
src .urls
d=`./date-min-iso.sh`
echo $d >>timestamp.log
wget -O vitte/vitte-$d.jpg ${VITTE}
wget -O hucke/hucke-$d.jpg ${HUCKE}
wget -O hafen-breit/hafen-breit-$d.jpg ${VITTE_HAFEN_BREIT}
