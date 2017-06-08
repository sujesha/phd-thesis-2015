#!/bin/sh
fileprefix="wget.forward-linearity-nonaff-rx-tx"

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
				paste $file1 $file2 $file3 $file4 > "$fileprefix".txt
        fi
fi


export GP_FILETOPLOT=""$fileprefix".txt"
export GPFILETITLE="Dispersed DomU affine Rx/Tx vs Colocated CPU"
export GPXLABEL="Dispersed DomU Non-affine Rx/Tx (kbps)"
export GPYLABEL="Colocated CPU (%)"
export GPFILENAME=""$fileprefix".eps"
export GPTITLE1="DomU (non-affine Rx)"
export GPTITLE2="DomU (non-affine Tx)"
export GPTITLE3="Dom0 (non-affine Rx)"
export GPTITLE4="Dom0 (non-affine Tx)"
gnuplot combine_4_aff_plot_files_and_plot.plot #Though named aff, it works for nonaff also

