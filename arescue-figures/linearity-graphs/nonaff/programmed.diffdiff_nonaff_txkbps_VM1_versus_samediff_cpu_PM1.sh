export GP_FILETOPLOT="plot_diffdiff_VM1_nonaff_txkbps_versus_samediff_PM1_cpu_bytetcp-nonaffonly-highrates-benchmark-VM2-10Mbps-Tx-final-metrics"
cut -d "," -f 7 bytetcp-nonaffonly-highrates-benchmark-VM2-10Mbps-Tx-final-metrics_diffdiff_VM1 > temp1
cut -d "," -f 2 bytetcp-nonaffonly-highrates-benchmark-VM2-10Mbps-Tx-final-metrics_samediff_PM1 > temp2
paste temp1 temp2 | sort -g | grep -v [a-z] > $GP_FILETOPLOT
export GPFILETITLE="Correlation of dispersed non-affine Tx to colocated Dom0 CPU"
export GPXLABEL="Dispersed DomU non-affine Tx (Mbps)"
export GPYLABEL="Colocated Dom0 CPU (%)"
export GPFILENAME="diffdiff_VM1_nonaff_txkbps_versus_samediff_PM1_cpu_bytetcp-nonaffonly-highrates-benchmark-VM2-10Mbps-Tx-final-metrics.eps"
gnuplot network.plot
