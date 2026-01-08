#!/usr/bin/env python3
import time
import adafruit_dht
import board

dht_device = adafruit_dht.DHT11(board.D4)

try:
    temperature_c = dht_device.temperature
    humidity = dht_device.humidity

    # print("{:.1f} C\t{}%".format(temperature_c, humidity))
    print("{}\t{}".format(temperature_c, humidity))
except RuntimeError as err:
    print(err.args[0])
