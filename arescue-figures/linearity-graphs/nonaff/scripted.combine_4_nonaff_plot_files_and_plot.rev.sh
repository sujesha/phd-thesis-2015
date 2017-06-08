#!/bin/sh
fileprefix="bytetcp.reverse-linearity-nonaff-rx-tx"

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
#				paste $file1 $file2 $file3 $file4 > "$fileprefix".txt
        fi
fi



export GP_FILETOPLOT=""$fileprefix".txt"
export GPFILETITLE="Colocated DomU non-affine Rx/Tx vs Dispersed CPU"
export GPXLABEL="Inter-PM Rx/Tx (Mbps)"
export GPYLABEL="Dispersed CPU (%)"
export GPFILENAME=""$fileprefix".eps"
export GPTITLE1="DomU CPU for inter-PM Rx"
export GPTITLE2="DomU CPU for inter-PM Tx"
export GPTITLE3="Dom0 CPU for inter-PM Rx"
export GPTITLE4="Dom0 CPU for inter-PM Tx"
gnuplot combine_4_aff_plot_files_and_plot.plot #Though named aff, it works for nonaff also

