export GP_FILETOPLOT="plot_samediff_VM1_nonaff_txkbps_versus_diffdiff_VM1_cpu_bytetcp-nonaffonly-highrates-benchmark-VM2-10Mbps-Tx-final-metrics"
cut -d "," -f 7 bytetcp-nonaffonly-highrates-benchmark-VM2-10Mbps-Tx-final-metrics_samediff_VM1 > temp1
cut -d "," -f 2 bytetcp-nonaffonly-highrates-benchmark-VM2-10Mbps-Tx-final-metrics_diffdiff_VM1 > temp2
paste temp1 temp2 | sort -g | grep -v [a-z] > $GP_FILETOPLOT
export GPFILETITLE="Correlation of colocated non-affine Tx to dispersed DomU CPU"
export GPXLABEL="Colocated DomU non-affine Tx (Mbps)"
export GPYLABEL="Dispersed DomU CPU (%)"
export GPFILENAME="samediff_VM1_nonaff_txkbps_versus_diffdiff_VM1_cpu_bytetcp-nonaffonly-highrates-benchmark-VM2-10Mbps-Tx-final-metrics.eps"
gnuplot network.plot
