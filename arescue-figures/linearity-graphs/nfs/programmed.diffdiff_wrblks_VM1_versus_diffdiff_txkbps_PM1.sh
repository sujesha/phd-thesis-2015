export GP_FILETOPLOT="plot_diffdiff_VM1_wrblks_versus_diffdiff_PM1_txkbps_wronly-by-rate-lowrates-benchmark-final-metrics"
cut -d "," -f 11 wronly-by-rate-lowrates-benchmark-final-metrics_diffdiff_VM1 > temp1
cut -d "," -f 5 wronly-by-rate-lowrates-benchmark-final-metrics_diffdiff_PM1 > temp2
paste temp1 temp2 | sort -g | grep -v [a-z] > $GP_FILETOPLOT
export GPFILETITLE="Correlation of dispersed disk write (blocks/s) to dispersed Dom0 Tx"
export GPXLABEL="Dispersed DomU disk write (blocks/s)"
export GPYLABEL="Dispersed Dom0 Tx (Kbps)"
export GPFILENAME="diffdiff_VM1_wrblks_versus_diffdiff_PM1_txkbps_wronly-by-rate-lowrates-benchmark-final-metrics.eps"
gnuplot generic.plot
