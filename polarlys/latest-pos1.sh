#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
printf "`ls ${DIR}/pos1/*.jpg | tail -n1`"
