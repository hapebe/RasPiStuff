#!/bin/bash
date -Iminutes | sed -e 's/T/-/' -e 's/:/-/g' -e 's/\+.*//'
