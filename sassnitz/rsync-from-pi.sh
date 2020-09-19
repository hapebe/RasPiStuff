#!/bin/bash
rsync -rv --bwlimit 200 --progress pi@192.168.178.24:~/sassnitz/ .
echo "$0 finished: `date +'%F %T'`"
