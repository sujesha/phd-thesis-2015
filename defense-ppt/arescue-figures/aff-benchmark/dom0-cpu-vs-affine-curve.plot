jpeg_type=1
eps_type=2
png_type=3

op_type=eps_type

if(op_type == eps_type) \
        set term postscript eps "Helvetica" 18 color enhanced
if(op_type == jpeg_type) \
        set term jpeg
if(op_type == png_type) \
        set term png medium

set size 0.75, 0.35



set xlabel "Network Rx/Tx rate (Mbps)" 
set ylabel "Dom0 CPU (%)" 
#set xrange [0:12]
set yrange [0:60]
#set xtics 20000
set ytics 20
set grid
set key left


#This variable GPFILENAME should be set from the shell script which 
#invokes gnuplot 

set output "dom0-cpu-vs-affine-curve.eps"
plot "dom0-cpu-vs-affine-curve.txt" using ($1/1000):2 title "sum of dispersed" with linespoints lt 1 lw 5 pt 1 lc rgb "red", "" using ($3/1000):4 title "colocated" with linespoints lt 2 lw 5 pt 6 lc rgb "blue"

#For iperf UDP data,
#plot "unweeded-iperfonly-2nd.dom0-cpu-vs-affine-curve.txt" using 1:2 title "sum of dispersed" with linespoints lt 2 lw 5 pt 1, "" using 3:4 title "colocated" with linespoints lt 6 lw 5 pt 6
