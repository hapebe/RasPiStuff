#!/usr/bin/env python3
import json

with open('../ship-data/ships-2020-08-02-10-24.json') as f:
	list = json.load(f)

for item in list:
	if (item['code'] == 'FM'):
		coords = item['coordinates']
		lon = coords['longitude']
		lat = coords['latitude']
		print(f"Finnmarken is at {lat}°;{lon}°")
