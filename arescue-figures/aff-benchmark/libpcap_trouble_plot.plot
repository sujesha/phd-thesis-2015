jpeg_type=1
eps_type=2
png_type=3

op_type=eps_type

if(op_type == eps_type) \
        set term postscript eps color
if(op_type == jpeg_type) \
        set term jpeg
if(op_type == png_type) \
        set term png medium

set size 0.75, 0.35


set xlabel "same-diff vif Rx (kbps)"
set ylabel "diff-diff vif Rx (kbps)"
#set xrange [0:12]
#set yrange [0:50]
#set xtics 1
#set ytics 5
set grid


#This variable GPFILENAME should be set from the shell script which 
#invokes gnuplot 

set output "libpcap-troubles.eps"
plot "libpcap_troubles" using 1:2 with linespoints
