#!/bin/bash
rsync -rv --bwlimit 500 --progress pi@leonie:~/polarlys/ .
echo "$0 finished: `date +'%F %T'`"
