export GP_FILETOPLOT="plot_samediff_VM2_aff_txkbps_versus_diffdiff_PM2_cpu_bytetcp-affonly-highrates-benchmark-final-metrics"
cut -d "," -f 5 bytetcp-affonly-highrates-benchmark-final-metrics_samediff_VM2 > temp1
cut -d "," -f 2 bytetcp-affonly-highrates-benchmark-final-metrics_diffdiff_PM2 > temp2
paste temp1 temp2 | sort -g | grep -v [a-z] > $GP_FILETOPLOT
export GPFILETITLE="Correlation of colocated affine Tx to dispersed Dom0 CPU"
export GPXLABEL="Colocated DomU affine Tx (Mbps)"
export GPYLABEL="Dispersed Dom0 CPU (%)"
export GPFILENAME="samediff_VM2_aff_txkbps_versus_diffdiff_PM2_cpu_bytetcp-affonly-highrates-benchmark-final-metrics.eps"
gnuplot network.plot
