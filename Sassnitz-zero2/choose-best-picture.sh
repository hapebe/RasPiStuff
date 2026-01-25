#!/bin/bash

# The idea is to use this script with a "globbing" pattern to pass in
# multiple version of the same photos, e.g.:
#   ./choose-best-picture.sh *.jpg

desirable_lum=$(./choose-desirable-luminance.sh)
# printf "desirable luminance: %.d\n" "$desirable_lum"

declare -A files
for var in "$@" ; do
    lum=$(luminance "$var")
    weight=$(echo "define abs(n) { if ( n > 0 ) return (n); { return (-n); } }; abs($desirable_lum-$lum)" | bc -l)
    files["$var"]=$weight
done


# this nice, clean code gives you an absolute value using bc / mathlib:
# echo "define abs(n) { if ( n > 0 ) return (n); { return (-n); } }; abs(120-50)" | bc -l

# just the one file with the lowest weight:
for f in "${!files[@]}"; do
    printf "%s\t%s\n" "${files[$f]}" "$f"
done | sort -n | cut -f2- | head -n 1