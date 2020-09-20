#!/usr/bin/env python3
from pathlib import Path
import json

def getFinnmarkenPos(jsonFilename):
    with open(jsonFilename) as f:
        list = json.load(f)

    for item in list:
        if (item['code'] == 'FM'):
            coords = item['coordinates']
            lon = coords['longitude']
            lat = coords['latitude']

    return lat,lon

csv = open("./positons-finnmarken.csv", "w")
csv.write("year,mon,day,hour,minute,latitude,longitude\n")
pathlist = Path('../ship-data').rglob('*.json')
for path in pathlist:
    filename = path.name
    date = filename[6:22]
    year, mon, day, hour, minute = date.split('-')
    # print(f"{hour}:{minute}")
    # print(str(path))
    try:
        lat,lon = getFinnmarkenPos(str(path))
        print(f"Finnmarken is at {lat}°;{lon}°")
        csv.write(f"{year},{mon},{day},{hour},{minute},{lat},{lon}\n")
    except:
        print(f"Problem with {str(path)}...")
csv.close()


