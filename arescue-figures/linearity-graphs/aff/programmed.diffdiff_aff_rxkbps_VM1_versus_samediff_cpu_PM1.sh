export GP_FILETOPLOT="plot_diffdiff_VM1_aff_rxkbps_versus_samediff_PM1_cpu_bytetcp-affonly-highrates-benchmark-final-metrics"
cut -d "," -f 4 bytetcp-affonly-highrates-benchmark-final-metrics_diffdiff_VM1 > temp1
cut -d "," -f 2 bytetcp-affonly-highrates-benchmark-final-metrics_samediff_PM1 > temp2
paste temp1 temp2 | sort -g | grep -v [a-z] > $GP_FILETOPLOT
export GPFILETITLE="Correlation of dispersed affine Rx to colocated Dom0 CPU"
export GPXLABEL="Dispersed DomU affine Rx (Mbps)"
export GPYLABEL="Colocated Dom0 CPU (%)"
export GPFILENAME="diffdiff_VM1_aff_rxkbps_versus_samediff_PM1_cpu_bytetcp-affonly-highrates-benchmark-final-metrics.eps"
gnuplot network.plot
