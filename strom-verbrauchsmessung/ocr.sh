#!/bin/bash
#
# sudo apt install tesseract-ocr tesseract-ocr-deu
#
if [ $# -lt 1 ] ; then
	>&2 echo "Usage $0 <source image>"
	exit 1
fi
# basenm=`basename ${1%.*}` # ; echo $basenm
basenm=${1##*/} # ; echo $basenm
basenm=${basenm%.*} # ; echo $basenm
tesseract -l deu $1 $basenm
cat ${basenm}.txt
