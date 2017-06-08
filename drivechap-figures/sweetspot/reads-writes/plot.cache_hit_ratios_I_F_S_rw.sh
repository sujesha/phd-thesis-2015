
gnuplot -persist <<EOF
set terminal pdf enhanced color font "Bold,10"
set output "sweetspot-reads-n-writes.pdf"
set size 1.0,1.0
set origin 0,0

set xlabel "content-cache size (as % of total memory)" font "Bold,10"
#set grid
set ylabel "cache-hit ratio (%)" font "Bold,10"
set xrange [0:100]
set yrange [0:120]
set xtic font "Bold,10"
set ytic font "Bold,10"
set key bottom right

set termoption dashed
set style line 1 lt 1 lc rgb "orange-red" lw 3 pt 7
set style line 2 lt 1 lc rgb "dark-blue" lw 3 pt 6
set style line 3 lt 1 lc rgb "dark-red" lw 3 pt 3
set style line 4 lt 2 lc rgb "orange-red" lw 3
set style line 5 lt 2 lc rgb "dark-blue" lw 3
set style line 6 lt 2 lc rgb "dark-red" lw 3

set label 4 at 80,`cat vanilla-reads-n-writes-webvm.txt | awk '{print $1 + 5}'` "{/Bold=10 webvm }" tc ls 4
set label 5 at 80,`cat vanilla-reads-n-writes-homes.txt | awk '{print $1 + 5}'` "{/Bold=10 homes }" tc ls 5
set label 6 at 80,`cat vanilla-reads-n-writes-mail.txt | awk '{print $1 + 5}'` "{/Bold=10 mail }" tc ls 6


plot "sweetspot-reads-n-writes-webvm.txt" using 1:2 with linespoints lt 1 lc rgb "orange-red" lw 3 pt 7  title "{/Bold=10 webvm (IODEDUP)}" , \
     "sweetspot-reads-n-writes-homes.txt" using 1:2 with linespoints lt 1 lc rgb "dark-blue" lw 3 pt 6  title "{/Bold=10 homes (IODEDUP)}" , \
     "sweetspot-reads-n-writes-mail.txt" using 1:2 with linespoints lt 1 lc rgb "dark-red" lw 3 pt 3  title "{/Bold=10 mail (IODEDUP)}", \
    `cat vanilla-reads-n-writes-webvm.txt` lt 2 lc rgb "orange-red" lw 3 title "{}", \
    `cat vanilla-reads-n-writes-homes.txt` lt 2 lc rgb "dark-blue" lw 3 title "{}", \
    `cat vanilla-reads-n-writes-mail.txt` lt 2 lc rgb "dark-red" lw 3 title "{}"

EOF

