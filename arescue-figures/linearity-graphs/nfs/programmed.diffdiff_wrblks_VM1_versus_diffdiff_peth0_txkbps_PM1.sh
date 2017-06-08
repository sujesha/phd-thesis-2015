export GP_FILETOPLOT="plot_diffdiff_VM1_wrblks_versus_diffdiff_PM1_peth0_txkbps_wronly-by-rate-lowrates-benchmark-final-metrics"
cut -d "," -f 11 wronly-by-rate-lowrates-benchmark-final-metrics_diffdiff_VM1 > temp1
cut -d "," -f 7 wronly-by-rate-lowrates-benchmark-final-metrics_diffdiff_PM1 > temp2
paste temp1 temp2 | sort -g | grep -v [a-z] > $GP_FILETOPLOT
export GPFILETITLE="Correlation of dispersed disk write (blocks/s) to Dom0 peth0 Tx"
export GPXLABEL="DomU disk write (blocks/s)"
export GPYLABEL="Dom0 peth0 Tx (Kbps)"
export GPFILENAME="diffdiff_VM1_wrblks_versus_diffdiff_PM1_peth0_txkbps_wronly-by-rate-lowrates-benchmark-final-metrics.eps"
gnuplot generic.plot
