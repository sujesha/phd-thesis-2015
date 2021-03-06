export GP_FILETOPLOT="plot_diffdiff_VM1_wrblks_versus_samediff_VM1_cpu_wronly-by-rate-lowrates-benchmark-final-metrics"
cut -d "," -f 11 wronly-by-rate-lowrates-benchmark-final-metrics_diffdiff_VM1 > temp1
cut -d "," -f 2 wronly-by-rate-lowrates-benchmark-final-metrics_samediff_VM1 > temp2
paste temp1 temp2 | sort -g | grep -v [a-z] > $GP_FILETOPLOT
export GPFILETITLE="Correlation of dispersed disk read (blocks/s) to colocated DomU CPU"
export GPXLABEL="Dispersed DomU disk write (blocks/s)"
export GPYLABEL="Colocated DomU CPU (%)"
export GPFILENAME="diffdiff_VM1_wrblks_versus_samediff_VM1_cpu_wronly-by-rate-lowrates-benchmark-final-metrics.eps"
gnuplot generic.plot
