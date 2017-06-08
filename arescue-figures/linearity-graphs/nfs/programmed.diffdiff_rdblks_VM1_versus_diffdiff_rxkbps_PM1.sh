export GP_FILETOPLOT="plot_diffdiff_VM1_rdblks_versus_diffdiff_PM1_rxkbps_rdonly-by-rate-lowrates-benchmark-final-metrics"
cut -d "," -f 10 rdonly-by-rate-lowrates-benchmark-final-metrics_diffdiff_VM1 > temp1
cut -d "," -f 4 rdonly-by-rate-lowrates-benchmark-final-metrics_diffdiff_PM1 > temp2
paste temp1 temp2 | sort -g | grep -v [a-z] > $GP_FILETOPLOT
export GPFILETITLE="Correlation of dispersed disk read (blocks/s) to dispersed Dom0 Rx"
export GPXLABEL="Dispersed DomU disk read (blocks/s)"
export GPYLABEL="Dispersed Dom0 Rx (Kbps)"
export GPFILENAME="diffdiff_VM1_rdblks_versus_diffdiff_PM1_rxkbps_rdonly-by-rate-lowrates-benchmark-final-metrics.eps"
gnuplot generic.plot
