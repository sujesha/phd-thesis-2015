#!/bin/sh

export GP_FILETOPLOT="temp_nonaff_rxkbps_plot"
export GPFILETITLE="Dispersed DomU Non Affine Rx vs colocated DomU CPU (with colocated DomU at constant Rx)"
export GPXLABEL="Dispersed DomU (VM1) Non Affine Rx (kbps)"
export GPYLABEL="Colocated DomU CPU (%)"
export GPFILENAME="diffdiff_nonaff_rxkbps_versus_samediff_cpu.png"
export GPTITLE1="VM2 at 10Mbps"
export GPTITLE2="VM2 at 20Mbps"
gnuplot nonaff.plot
