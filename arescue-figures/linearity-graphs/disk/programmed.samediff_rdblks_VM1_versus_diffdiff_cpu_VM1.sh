export GP_FILETOPLOT="plot_samediff_VM1_rdblks_versus_diffdiff_VM1_cpu_rdonly-by-rate-lowrates-benchmark-final-metrics"
cut -d "," -f 10 rdonly-by-rate-lowrates-benchmark-final-metrics_samediff_VM1 > temp1
cut -d "," -f 2 rdonly-by-rate-lowrates-benchmark-final-metrics_diffdiff_VM1 > temp2
paste temp1 temp2 | sort -g | grep -v [a-z] > $GP_FILETOPLOT
export GPFILETITLE="Correlation of colocated disk read (blocks/s) to dispersed DomU CPU"
export GPXLABEL="Colocated DomU disk read (blocks/s)"
export GPYLABEL="Dispersed DomU CPU (%)"
export GPFILENAME="samediff_VM1_rdblks_versus_diffdiff_VM1_cpu_rdonly-by-rate-lowrates-benchmark-final-metrics.eps"
gnuplot generic.plot
