
gnuplot -persist <<EOF
set terminal pdf enhanced color font "Bold,10"
set output "sweetspotaverted-reads-n-writes.pdf"
set size 1.0,1.0
set origin 0,0
#set format y "%1.1E"
set format y "%.1l 10^%T"

set xlabel "content-cache size (as % of total memory)"
#set grid
set ylabel "number of disk reads \naverted"
set xrange [0:100]
set yrange [0:1600000]
set xtic font "Bold,10"
set ytic font "Bold,10"
set key top left

set termoption dashed
set style line 1 lt 1 lc rgb "orange-red" lw 8 pt 7
set style line 2 lt 1 lc rgb "dark-blue" lw 8 pt 6
set style line 3 lt 1 lc rgb "dark-red" lw 8 pt 3
set style line 4 lt 2 lc rgb "orange-red" lw 8
set style line 5 lt 2 lc rgb "dark-blue" lw 8
set style line 6 lt 2 lc rgb "dark-red" lw 8


plot "sweetspotaverted-reads-n-writes-homes.txt" using 1:2 with linespoints lt 1 lc rgb "dark-blue" lw 8 pt 4  title "{/Bold=8 homes (IODEDUP)}" , \
     "sweetspotaverted-reads-n-writes-mail.txt" using 1:2 with linespoints lt 1 lc rgb "dark-red" lw 8 pt 6  title "{/Bold=8 mail (IODEDUP)}", \
	"sweetspotaverted-reads-n-writes-webvm.txt" using 1:2 with linespoints lt 1 lc rgb "orange-red" lw 8 pt 8  title "{/Bold=8 webvm (IODEDUP)}"


EOF

#set label 4 at 30,`cat vanilla-readsaverted-reads-n-writes-webvm.txt | awk '{print $1 + 5000}'` "{/Bold=8 webvm }" tc ls 4
#set label 5 at 30,`cat vanilla-readsaverted-reads-n-writes-homes.txt | awk '{print $1 + 7000}'` "{/Bold=8 homes }" tc ls 5
#set label 6 at 30,`cat vanilla-readsaverted-reads-n-writes-mail.txt | awk '{print $1 + 5000}'` "{/Bold=8 mail }" tc ls 6
#    `cat vanilla-readsaverted-reads-n-writes-webvm.txt` lt 2 lc rgb "orange-red" lw 8 title "{}", \
#    `cat vanilla-readsaverted-reads-n-writes-homes.txt` lt 2 lc rgb "dark-blue" lw 8 title "{}", \
#    `cat vanilla-readsaverted-reads-n-writes-mail.txt` lt 2 lc rgb "dark-red" lw 8 title "{}"
