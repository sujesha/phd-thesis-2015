
gnuplot -persist <<EOF
set terminal pdf enhanced color font "Bold,10"
set output "readsaverted-reads-n-writes.pdf"
set size 1.0,1.0
set boxwidth 0.9 relative
set style data histograms
set style histogram clustered gap 2
set style fill pattern 9.5 border -1
#set format y "%1.1E"
#set format y "%.0s 10^%T"
#set format y "%g 10^%T"
set format y "%.0l 10^%T"
set key top left

unset grid
set ylabel "number of disk reads \n averted" font "Bold,10"
plot "readsaverted-reads-n-writes-vanilla.txt" using 2:xticlabels(1) fs pattern 1 lc rgb "dark-red" title "{/Bold=10 Vanilla}", \
	"readsaverted-reads-n-writes-confided.txt" using 2:xticlabels(1) fs pattern 3 lc rgb "dark-green" title "{/Bold=10 DRIVE}", \
	"readsaverted-reads-n-writes-iodedup.txt" using 2:xticlabels(1) fs pattern 4 lc rgb "dark-blue" title "{/Bold=10 IODEDUP}"

EOF

