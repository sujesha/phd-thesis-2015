export GP_FILETOPLOT="plot_diffdiff_VM2_aff_txkbps_versus_samediff_VM2_cpu_bytetcp-affonly-highrates-benchmark-final-metrics"
cut -d "," -f 5 bytetcp-affonly-highrates-benchmark-final-metrics_diffdiff_VM2 > temp1
cut -d "," -f 2 bytetcp-affonly-highrates-benchmark-final-metrics_samediff_VM2 > temp2
paste temp1 temp2 | sort -g | grep -v [a-z] > $GP_FILETOPLOT
export GPFILETITLE="Correlation of dispersed affine Tx to colocated DomU CPU"
export GPXLABEL="Dispersed DomU affine Tx (Mbps)"
export GPYLABEL="Colocated DomU CPU (%)"
export GPFILENAME="diffdiff_VM2_aff_txkbps_versus_samediff_VM2_cpu_bytetcp-affonly-highrates-benchmark-final-metrics.eps"
gnuplot network.plot
