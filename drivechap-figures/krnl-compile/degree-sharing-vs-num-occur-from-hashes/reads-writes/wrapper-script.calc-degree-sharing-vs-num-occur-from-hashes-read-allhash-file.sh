#!/bin/sh

list=`ls hashes-read-allhash-*`

for file in $list
do
	echo "for $file"

	if echo $file | grep "homes" > /dev/null
	then
		suffix="homes.txt"
	elif echo $file | grep "mail" > /dev/null
	then
		suffix="mail.txt"
	elif echo $file | grep "webvm" > /dev/null
	then
		suffix="webvm.txt"
	elif echo $file | grep "aggregate-hw" > /dev/null
	then
		suffix="aggregate-hw.txt"
	elif echo $file | grep "krnl" > /dev/null
	then
		suffix="krnl.txt"
	fi
	script.calc-degree-sharing-vs-num-occur-from-hashes-read-allhash-file.sh $file > w-repeats-allhash-degree-sharing-vs-num-occur-$suffix
done
