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



set xlabel "Rx rate (Mbps)" 
set ylabel "DomU CPU (%)" 
#set xrange [0:12]
set yrange [0:40]
#set xtics 20000
set ytics 10
set grid
set key left

#set output "unweeded-iperfonly-2nd.domu-rx.eps"
#plot "unweeded-iperfonly-2nd.domu-rx.txt" using 1:2 title "dispersed" with linespoints, "" using 3:4 title "colocated" with linespoints


set output "domU-cpu-vs-affine-rx-curve.eps"
plot "domU-cpu-vs-affine-rx-curve.txt" using ($1/1000):2 title "dispersed" with linespoints lt 1 lc rgb "red" lw 5 pt 1, "" using ($3/1000):4 title "colocated" with linespoints lt 2 lw 5 pt 6 lc rgb "blue"

