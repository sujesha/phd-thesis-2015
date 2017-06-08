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
				paste $file1 $file2 $file3 $file4 > bytetcp.reverse-linearity-aff-rx-tx.txt
        fi
fi




export GP_FILETOPLOT="bytetcp.reverse-linearity-aff-rx-tx.txt"
export GPFILETITLE="Colocated DomU affine Rx/Tx vs Dispersed CPU"
export GPXLABEL="Colocated DomU Affine Rx/Tx (kbps)"
export GPYLABEL="Dispersed CPU (%)"
export GPFILENAME="bytetcp.reverse-linearity-aff-rx-tx.eps"
export GPTITLE1="DomU (affine Rx)"
export GPTITLE2="DomU (affine Tx)"
export GPTITLE3="Dom0 (affine Rx)"
export GPTITLE4="Dom0 (affine Tx)"
gnuplot combine_4_aff_plot_files_and_plot.plot
#gnuplot generic-multi-plot.plot

