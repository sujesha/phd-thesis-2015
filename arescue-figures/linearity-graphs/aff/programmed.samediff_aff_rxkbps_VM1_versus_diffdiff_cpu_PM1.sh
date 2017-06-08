export GP_FILETOPLOT="plot_samediff_VM1_aff_rxkbps_versus_diffdiff_PM1_cpu_bytetcp-affonly-highrates-benchmark-final-metrics"
cut -d "," -f 4 bytetcp-affonly-highrates-benchmark-final-metrics_samediff_VM1 > temp1
cut -d "," -f 2 bytetcp-affonly-highrates-benchmark-final-metrics_diffdiff_PM1 > temp2
paste temp1 temp2 | sort -g | grep -v [a-z] > $GP_FILETOPLOT
export GPFILETITLE="Correlation of colocated affine Rx to dispersed Dom0 CPU"
export GPXLABEL="Colocated DomU affine Rx (Mbps)"
export GPYLABEL="Dispersed Dom0 CPU (%)"
export GPFILENAME="samediff_VM1_aff_rxkbps_versus_diffdiff_PM1_cpu_bytetcp-affonly-highrates-benchmark-final-metrics.eps"
gnuplot network.plot
