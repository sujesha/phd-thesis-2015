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

#set size 0.75, 0.35
set size 0.75, 0.75



set xlabel "Affine Rx rate (Mbps)" 
set ylabel "DomU CPU (%)" 
#set xrange [0:12]
#set yrange [0:60]
#set xtics 20000
#set ytics 5
set grid
set key left

#set output "unweeded-iperfonly-2nd.domu-rx.eps"
#plot "unweeded-iperfonly-2nd.domu-rx.txt" using 1:2 title "dispersed" with linespoints, "" using 3:4 title "co-located" with linespoints


set output "rubis62-domU-cpu-vs-affine-rx-curve.eps"
plot "rubis62-domU-cpu-vs-affine-rx-curve.txt" using ($1/1000):2 title "dispersed" with points lt 1 lw 5 pt 1, "" using ($3/1000):4 title "co-located" with points lt 2 lw 5 pt 6

