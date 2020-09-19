#!/bin/bash
touch images.mjpg
truncate -s 0 images.mjpg
while read f ; do
	cat $f >> images.mjpg
done < files.txt
