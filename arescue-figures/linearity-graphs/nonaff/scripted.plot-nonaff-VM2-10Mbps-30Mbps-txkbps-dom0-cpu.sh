#!/bin/sh

export GP_FILETOPLOT="dom0_nonaff_txkbps_plot"
export GPFILETITLE="Dispersed DomU Non Affine Tx vs colocated Dom0 CPU (with colocated DomU at constant Tx)"
export GPXLABEL="Dispersed DomU (VM1) Non Affine Tx (kbps)"
export GPYLABEL="Colocated Dom0 CPU (%)"
export GPFILENAME="diffdiff_nonaff_txkbps_versus_samediff_dom0_cpu.png"
export GPTITLE1="VM2 at 10Mbps"
export GPTITLE2="VM2 at 30Mbps"
gnuplot nonaff.plot
