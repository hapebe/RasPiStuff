#!/bin/bash
rsync -rv --bwlimit 500 --progress pi@verapi:~/strom-verbrauchsmessung/ .
echo "$0 finished: `date +'%F %T'`"
