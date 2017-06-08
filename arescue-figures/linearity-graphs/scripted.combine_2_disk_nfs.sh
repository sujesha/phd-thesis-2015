#!/bin/sh

if [ $# -ne 2 ]
then
	echo "Usage: $0 <plot-file1> <plot-file2>" 
	exit
fi

if [ ! -f $1 -o ! -f $2 ]
then
	echo "$0: Input files do not exist"
	exit
fi

file1=$1
file2=$2
file3=$3
file4=$4

paste $file1 $file2 > disk-nfs.txt

export GP_FILETOPLOT="disk-nfs.txt"
export GPFILETITLE="DomU disk read/write vs Dom0 Rx/Tx"
export GPXLABEL="DomU disk read/write (blocks/s)"
export GPYLABEL="Dom0 Rx/Tx (kbps)"
export GPFILENAME="disk-nfs.eps"
export GPTITLE1="Dom0 Rx"
export GPTITLE2="Dom0 Tx"
gnuplot generic-multi-plot.plot

