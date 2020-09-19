#!/bin/bash
montage vitte.jpg vitte-hafen-l.jpg vitte-hafen-r.jpg -tile 3x1 -geometry 640x480 oben.jpg
montage hucke.jpg hafen-breit.jpg -mode Concatenate -tile x1 unten.jpg
montage oben.jpg unten.jpg -tile 1x2 -geometry 1920x480 alle.jpg
