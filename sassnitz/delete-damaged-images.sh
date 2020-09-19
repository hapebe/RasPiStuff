#!/bin/bash

# written for webcam downloading / video creation automation
# 2017-08-05 hapebe@gmx.de
# 
# first attempt was using identify (from ImageMagick suite), but it did not 
# return an error for missing / corrupt image data in a partially okay JPEG.
# I found jpeginfo to work better for them!
#

if [ -z "$1" ]; then
	echo "Please supply a directory name as parameter."
	exit 1
fi

for IMG_FILE in $1/*.jpg; do
	# echo "$IMG_FILE"
	# identify is part of ImageMagick
	# identify $IMG_FILE 1>/dev/null 2>/dev/null
	# hmm, using jpeginfo instead (identify does not report corrupt / missing data)
	jpeginfo -c "$IMG_FILE" 1>/dev/null 2>/dev/null 
	if [ $? -ne 0 ]; then
		FILESIZE=$(stat -c%s "$IMG_FILE")
		echo "$? -- $FILESIZE bytes -- $IMG_FILE"
		rm $IMG_FILE
	fi
done
