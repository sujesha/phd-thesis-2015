
gnuplot -persist <<EOF
set terminal pdf enhanced color font "Bold,10"
set output "eval-reads-n-writes.pdf"
set size 1.0,1.0
set boxwidth 0.9 relative
set style data histograms
set style histogram clustered gap 2
set style fill pattern 9.5 border -1
set key top left

unset grid
set ylabel "cache-hit ratio (%)" font "Bold,10"
set yrange [0:110]
plot "eval-reads-n-writes-vanilla.txt" using 2:xticlabels(1) fs pattern 1 lc rgb "dark-red" title "{/Bold=10 Vanilla}", \
	"eval-reads-n-writes-confided.txt" using 2:xticlabels(1) fs pattern 3 lc rgb "dark-green" title "{/Bold=10 DRIVE}", \
	"eval-reads-n-writes-iodedup.txt" using 2:xticlabels(1) fs pattern 4 lc rgb "dark-blue" title "{/Bold=10 IODEDUP}"

EOF

