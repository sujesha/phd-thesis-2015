jpeg_type=1
eps_type=2
png_type=3

op_type=eps_type

if(op_type == eps_type) \
        set term postscript eps "Helvetica" 18
if(op_type == jpeg_type) \
        set term jpeg
if(op_type == png_type) \
        set term png medium

set size 0.75, 0.35



set xlabel "Affine network Rx rate (Mbps)" 
set ylabel "Dom0 CPU (%)" 
#set xrange [0:12]
set yrange [0:60]
#set xtics 20000
#set ytics 5
set grid
set key left


#This variable GPFILENAME should be set from the shell script which 
#invokes gnuplot 

#drawing smooth approximation curves

set output "rubis62-dom0-cpu-vs-affine-curve.eps"
plot "rubis62-dom0-cpu-vs-affine-curve.txt" using ($1/1000):2:(1.0) smooth acsplines title "sum of dispersed" with lines lt 1 lw 5, "" using ($3/1000):4:(1.0) smooth acsplines title "co-located" with lines lt 2 lw 5

#For iperf UDP data,
#plot "unweeded-iperfonly-2nd.dom0-cpu-vs-affine-curve.txt" using 1:2 title "sum of dispersed" with steps lt 2 lw 5 pt 1, "" using 3:4 title "co-located" with steps lt 6 lw 5 pt 6
