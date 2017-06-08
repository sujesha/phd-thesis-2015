export GP_FILETOPLOT="plot_samediff_VM1_wrblks_versus_diffdiff_PM1_cpu_wronly-by-rate-lowrates-benchmark-final-metrics"
cut -d "," -f 11 wronly-by-rate-lowrates-benchmark-final-metrics_samediff_VM1 > temp1
cut -d "," -f 2 wronly-by-rate-lowrates-benchmark-final-metrics_diffdiff_PM1 > temp2
paste temp1 temp2 | sort -g | grep -v [a-z] > $GP_FILETOPLOT
export GPFILETITLE="Correlation of colocated disk write (blocks/s) to dispersed Dom0 CPU"
export GPXLABEL="Colocated DomU disk write (blocks/s)"
export GPYLABEL="Dispersed Dom0 CPU (%)"
export GPFILENAME="samediff_VM1_wrblks_versus_diffdiff_PM1_cpu_wronly-by-rate-lowrates-benchmark-final-metrics.eps"
gnuplot generic.plot
