#!/bin/sh

if [ $# -ne 4 -a $# -ne 0 ]
then
    echo "Usage: $0" 
    echo OR
    echo "Usage: $0 <plot-file1> <plot-file2> <plot-file3> <plot-file4>" 
    exit
fi

if [ $# -eq 4 ]
then
        if [ ! -f $1 -o ! -f $2 ]
        then
            echo "$0: Input files do not exist"
            exit
        else
                file1=$1
                file2=$2
                file3=$3
                file4=$4
				paste $file1 $file2 $file3 $file4 > new-reverse-linearity-disk-rd-wr.txt
        fi
fi


export GP_FILETOPLOT="new-reverse-linearity-disk-rd-wr.txt"
export GPFILETITLE="Colocated DomU disk read/write vs Dispersed CPU"
export GPXLABEL="Colocated DomU disk read/write (blocks/s)"
export GPYLABEL="Dispersed CPU (%)"
export GPFILENAME="new-reverse-linearity-disk-rd-wr.eps"
export GPTITLE1="Dispersed DomU CPU for disk read"
export GPTITLE2="Dispersed DomU CPU for disk write"
export GPTITLE3="Dispersed Dom0 CPU for disk read"
export GPTITLE4="Dispersed Dom0 CPU for disk write"
gnuplot combine_4_disk_plot_files_and_plot.plot #Useful for disk also coz read->Rx and write->Tx

