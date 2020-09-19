#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
printf "`ls ${DIR}/feodora/*.jpg | tail -n1`"
