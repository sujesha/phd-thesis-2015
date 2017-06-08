export GP_FILETOPLOT="plot_diffdiff_VM2_aff_txkbps_versus_samediff_PM1_cpu_bytetcp-affonly-highrates-benchmark-final-metrics"
cut -d "," -f 5 bytetcp-affonly-highrates-benchmark-final-metrics_diffdiff_VM2 > temp1
cut -d "," -f 2 bytetcp-affonly-highrates-benchmark-final-metrics_samediff_PM1 > temp2
paste temp1 temp2 | sort -g | grep -v [a-z] > $GP_FILETOPLOT
export GPFILETITLE="Correlation of dispersed affine Tx to colocated Dom0 CPU"
export GPXLABEL="Dispersed DomU affine Tx (Mbps)"
export GPYLABEL="Colocated Dom0 CPU (%)"
export GPFILENAME="diffdiff_VM2_aff_txkbps_versus_samediff_PM1_cpu_bytetcp-affonly-highrates-benchmark-final-metrics.eps"
gnuplot network.plot
