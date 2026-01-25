#!/bin/bash

sonnenstand_base_url="http://localhost:8000/now"
desirable_luminance=125 # the default value


JSON=$(mktemp) # temporary file

curl -sS "${sonnenstand_base_url}?lat=54.5157&lon=13.64451&timezone=Europe/Berlin" -o "$JSON"
if [ $? -ne 0 ] ; then
    echo "Error: could not reach the local Sassnitz-zero2 server." >&2
else
    # we actually have a response
    # jq < "$JSON" # pretty-print the response data
    sun_elevation=$(jq ".elevation_int" $JSON)

    if [ $sun_elevation -le 5 ] ; then
        # sun is low, use lower luminance
        desirable_luminance=80
    fi
    if [ $sun_elevation -le -2 ] ; then
        # sun is below horizon, use lower luminance
        desirable_luminance=40
    fi
fi

printf "%.d" "$desirable_luminance"

rm "$JSON" # delete temporary file