export GP_FILETOPLOT="plot_samediff_VM1_nonaff_rxkbps_versus_diffdiff_VM1_cpu_bytetcp-nonaffonly-highrates-benchmark-VM2-10Mbps-Rx-final-metrics"
cut -d "," -f 6 bytetcp-nonaffonly-highrates-benchmark-VM2-10Mbps-Rx-final-metrics_samediff_VM1 > temp1
cut -d "," -f 2 bytetcp-nonaffonly-highrates-benchmark-VM2-10Mbps-Rx-final-metrics_diffdiff_VM1 > temp2
paste temp1 temp2 | sort -g | grep -v [a-z] > $GP_FILETOPLOT
export GPFILETITLE="Correlation of colocated non-affine Rx to dispersed DomU CPU"
export GPXLABEL="Colocated DomU non-affine Rx (Mbps)"
export GPYLABEL="Dispersed DomU CPU (%)"
export GPFILENAME="samediff_VM1_nonaff_rxkbps_versus_diffdiff_VM1_cpu_bytetcp-nonaffonly-highrates-benchmark-VM2-10Mbps-Rx-final-metrics.eps"
gnuplot network.plot
