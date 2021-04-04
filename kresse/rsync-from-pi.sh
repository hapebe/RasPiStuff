#!/bin/bash
rsync -rv --bwlimit 500 --progress pi@leonie:~/kresse/ .
echo "$0 finished: `date +'%F %T'`"
