#!/bin/bash
years=(2019 2020 2021)
months=(01 02 03 04 05 06 07 08 09 10 11 12)

printf "month\tpl1\tpl2\tfm1\tfm2\tship-data\n"
for year in "${years[@]}" ; do
	for month in "${months[@]}" ; do
		token=$year-$month
		pos1=$(ls ../pos1/*${token}*.jpg 2> /dev/null | wc -l)
		pos2=$(ls ../pos2/*${token}*.jpg 2> /dev/null | wc -l)
		fm1=$(ls ../finnmarken1/*${token}*.jpg 2> /dev/null | wc -l)
		fm2=$(ls ../finnmarken1/*${token}*.jpg 2> /dev/null | wc -l)
		shipData=$(ls ../ship-data/*${token}*.json 2> /dev/null | wc -l)
		ntotal=$(($pos1 + $pos2 + $fm1 + $fm2))
		if [[ $ntotal -gt 0 ]] ; then
			printf "$token\t$pos1\t$pos2\t$fm1\t$fm2\t$shipData\n"
		fi
	done
done
