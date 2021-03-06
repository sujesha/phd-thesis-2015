gnuplot -persist <<EOF

set terminal pdf enhanced color font "Bold,3"
set output "sweetspot-multiplot-revised.pdf"

#set tmargin 2
#set bmargin 3
#set lmargin 2
#set rmargin 4

set multiplot layout 1,4 title ""

set size 0.3, 0.4
set origin 0.10, 0.53
set title "(a) read-only"
set xlabel "content-cache size (as % of total memory)" font "Bold,3"
#set grid
set ylabel "cache-hit ratio (%)" font "Bold,3"
set xrange [0:100]
set yrange [0:100]
set xtic font "Bold,3"
set ytic font "Bold,3"
set termoption dashed
set key at screen 0.65, screen 0.39

plot "reads/sweetspot-reads-homes.txt" using 1:2 with linespoints lt 1 lc rgb "dark-blue" lw 2 pt 4 ps 0.5 title "{/Bold=3 homes (IODEDUP)}", \
     "reads/sweetspot-reads-mail.txt" using 1:2 with linespoints lt 1 lc rgb "dark-red" lw 2 pt 6 ps 0.5 title "{/Bold=3 mail (IODEDUP)}", \
 "reads/sweetspot-reads-webvm.txt" using 1:2 with linespoints lt 1 lc rgb "orange-red" lw 2 pt 8 ps 0.5 title "{/Bold=3 webvm (IODEDUP)}", \
	"reads/vanilla-reads-homes.txt" using 1:2 with linespoints lt 2 lc rgb "dark-blue" lw 2 pt 5 ps 0.5 notitle "{/Bold=3 homes (Vanilla)}", \
     "reads/vanilla-reads-mail.txt" using 1:2 with linespoints lt 2 lc rgb "dark-red" lw 2 pt 7 ps 0.5 notitle "{/Bold=3 mail (Vanilla)}", \
	 "reads/vanilla-reads-webvm.txt" using 1:2 with linespoints lt 2 lc rgb "orange-red" lw 2 pt 9 ps 0.5 notitle "{/Bold=3 webvm (Vanilla)}"


#############################################################

set title "(b) write-only"
set origin 0.45, 0.53
set size 0.3,0.4
unset xtics
unset ytics

set xlabel "content-cache size (as % of total memory)" font "Bold,3"
#set grid
set ylabel "cache-hit ratio (%)" font "Bold,3"
set xrange [0:100]
set yrange [0:100]
set xtic font "Bold,3"
set ytic font "Bold,3"
set key at screen 0.65, screen 0.29

plot "writes/sweetspot-writes-homes.txt" using 1:2 with linespoints lt 1 lc rgb "dark-blue" lw 2 pt 4 ps 0.5 notitle "{/Bold=3 homes (IODEDUP)}", \
     "writes/sweetspot-writes-mail.txt" using 1:2 with linespoints lt 1 lc rgb "dark-red" lw 2 pt 6 ps 0.5 notitle "{/Bold=3 mail (IODEDUP)}", \
 "writes/sweetspot-writes-webvm.txt" using 1:2 with linespoints lt 1 lc rgb "orange-red" lw 2 pt 8 ps 0.5 notitle "{/Bold=3 webvm (IODEDUP)}", \
    "writes/vanilla-writes-homes.txt" using 1:2 with linespoints lt 2 lc rgb "dark-blue" lw 2 pt 5 ps 0.5 title "{/Bold=3 homes (Vanilla)}", \
     "writes/vanilla-writes-mail.txt" using 1:2 with linespoints lt 2 lc rgb "dark-red" lw 2 pt 7 ps 0.5 title "{/Bold=3 mail (Vanilla)}", \
     "writes/vanilla-writes-webvm.txt" using 1:2 with linespoints lt 2 lc rgb "orange-red" lw 2 pt 9 ps 0.5 title "{/Bold=3 webvm (Vanilla)}"

##############################################################
unset key
set title "(c) read/write"
set size 0.3,0.4
set origin 0.10, 0.05
unset xtics
unset ytics

set xlabel "content-cache size (as % of total memory)" font "Bold,3"
#set grid
set xrange [0:100]
set yrange [0:100]
set ylabel "cache-hit ratio (%)" font "Bold,3"
set xtic font "Bold,3"
set ytic font "Bold,3"
set key bottom right

plot "reads-writes/sweetspot-reads-n-writes-homes.txt" using 1:2 with linespoints lt 1 lc rgb "dark-blue" lw 2 pt 4 ps 0.5 notitle "{/Bold=3 homes (IODEDUP)}" , \
     "reads-writes/sweetspot-reads-n-writes-mail.txt" using 1:2 with linespoints lt 1 lc rgb "dark-red" lw 2 pt 6 ps 0.5 notitle "{/Bold=3 mail (IODEDUP)}", \
	"reads-writes/sweetspot-reads-n-writes-webvm.txt" using 1:2 with linespoints lt 1 lc rgb "orange-red" lw 2 pt 8 ps 0.5 notitle "{/Bold=3 webvm (IODEDUP)}" , \
	"reads-writes/vanilla-reads-n-writes-homes.txt" using 1:2 with linespoints lt 2 lc rgb "dark-blue" lw 2 pt 5 ps 0.5 notitle "{/Bold=3 homes (IODEDUP)}" , \
     "reads-writes/vanilla-reads-n-writes-mail.txt" using 1:2 with linespoints lt 2 lc rgb "dark-red" lw 2 pt 7 ps 0.5 notitle "{/Bold=3 mail (IODEDUP)}", \
	"reads-writes/vanilla-reads-n-writes-webvm.txt" using 1:2 with linespoints lt 2 lc rgb "orange-red" lw 2 pt 9 ps 0.5 notitle "{/Bold=3 webvm (IODEDUP)}" 

##############################################################
unset multiplot


EOF
