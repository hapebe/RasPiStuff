#!/bin/bash
if [ $(id -u) -ne 0 ] ; then
	echo "This script must be run as root!"
	exit 1
fi
mount -t vboxsf OFFLINE /media/sf_OFFLINE
rsync -av /home/hapebe/sassnitz/* /media/sf_OFFLINE/sassnitz
