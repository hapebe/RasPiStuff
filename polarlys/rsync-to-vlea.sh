#!/bin/bash
rsync -rv --progress . hapebe@virtual-lea:~/polarlys/
# --bwlimit 200
echo "$0 finished: `date +'%F %T'`"
