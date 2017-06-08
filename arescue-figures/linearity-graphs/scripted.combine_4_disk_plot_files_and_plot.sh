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
				paste $file1 $file2 $file3 $file4 > new-forward-linearity-disk-rd-wr.txt
        fi
fi

export GP_FILETOPLOT="new-forward-linearity-disk-rd-wr.txt"
export GPFILETITLE="Dispersed DomU disk read/write vs Colocated CPU"
export GPXLABEL="Dispersed DomU disk read/write (blocks/s)"
export GPYLABEL="Colocated CPU (%)"
export GPFILENAME="new-forward-linearity-disk-rd-wr.eps"
export GPTITLE1="DomU (disk read)"
export GPTITLE2="DomU (disk write)"
export GPTITLE3="Dom0 (disk read)"
export GPTITLE4="Dom0 (disk write)"
gnuplot combine_4_disk_plot_files_and_plot.plot #Useful for disk also coz read->Rx and write->Tx

