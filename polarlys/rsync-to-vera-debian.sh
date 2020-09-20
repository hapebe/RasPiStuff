#!/bin/bash
rsync -rv --progress . hapebe@vera-debian:~/polarlys/
# --bwlimit 200
echo "$0 finished: `date +'%F %T'`"
