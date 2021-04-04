#!/usr/bin/python3
import configparser
import requests
import json

config = configparser.ConfigParser()
config.read(".keys")
api_key = config['OpenWeatherMap']['api_key']
lat = config['OpenWeatherMap']['lat']
lon = config['OpenWeatherMap']['lon']

url = "https://api.openweathermap.org/data/2.5/onecall?lat=%s&lon=%s&appid=%s&units=metric" % (lat, lon, api_key)

response = requests.get(url)
# print(response.text)
data = json.loads(response.text)
temp = data['current']['temp']
print("   ", end='')
print("{:.1f}°C".format(temp), end='   ')
pressure = data['current']['pressure']
print("{:.0f} hPa".format(pressure), end='')
print()
