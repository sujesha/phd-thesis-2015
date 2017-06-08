export GP_FILETOPLOT="plot_diffdiff_VM1_rdblks_versus_samediff_PM1_cpu_rdonly-by-rate-lowrates-benchmark-final-metrics"
cut -d "," -f 10 rdonly-by-rate-lowrates-benchmark-final-metrics_diffdiff_VM1 > temp1
cut -d "," -f 2 rdonly-by-rate-lowrates-benchmark-final-metrics_samediff_PM1 > temp2
paste temp1 temp2 | sort -g | grep -v [a-z] > $GP_FILETOPLOT
export GPFILETITLE="Correlation of dispersed disk read (blocks/s) to colocated Dom0 CPU"
export GPXLABEL="Dispersed DomU disk write (blocks/s)"
export GPYLABEL="Colocated Dom0 CPU (%)"
export GPFILENAME="diffdiff_VM1_rdblks_versus_samediff_PM1_cpu_rdonly-by-rate-lowrates-benchmark-final-metrics.eps"
gnuplot generic.plot
