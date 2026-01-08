# Collecting data from a DHT11 sensor on a Pi Zero 2

2025-12-07

I followed: https://pimylifeup.com/raspberry-pi-dht11-sensor/

## Housekeeping and general setup

```
sudo apt install python3 python3-pip python3-venv
```

(all of them were already present)

Compile and install the LGPIO library on our Raspberry Pi from its source code, 
https://pimylifeup.com/raspberry-pi-install-lgpio/

```
sudo apt install unzip wget swig build-essential python3-dev python3-setuptools
```

(this only actually installed swig / swig4.0)

```
mkdir -p ~/Projects/lgpio
cd ~/Projects/lgpio
wget https://github.com/joan2937/lg/archive/master.zip
unzip master.zip
cd lg-master
make
sudo make install
# now we could remove the project folder!
```

```
python3 -m venv env
# will neeed to re-run this whenever we want to run the DHT11 script anew:
source env/bin/activate
# but this we only need once:
python3 -m pip install adafruit-circuitpython-dht lgpio RPi.GPIO
```

At this point, we create the actual dht11.py (and later: read-data.py) script.

> (env) admin@zero2:~/Projects/dht11-on-pi $ ./read-data.py 
> 22.0 C	17%
> Lost access to message queue
