#!/bin/bash
mkdir timeline
find pos1 -name \*-08-13.jpg -exec cp {} timeline/ ';'
cd timeline
ls
