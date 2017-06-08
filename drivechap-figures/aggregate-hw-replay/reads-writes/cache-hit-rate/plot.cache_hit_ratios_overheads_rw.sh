
gnuplot -persist <<EOF
set terminal pdf enhanced color font "Bold,8"
set output "overheads-reads-n-writes.pdf"
set size 1.0,0.8
set boxwidth 0.9 relative
set style data histograms
set style histogram clustered gap 2
set style fill pattern 9.5 border -1
set key top left
set key sample 1.0

unset grid
set ylabel "cache-hit ratio (%)" font "Bold,8"
set yrange [0:125]
#set xrange [-2:4]
plot "overheads-reads-n-writes-vanilla.txt" using 2:xticlabels(1) fs pattern 1 lc rgb "dark-red" title "{/Bold=6 Vanilla}", \
	"overheads-reads-n-writes-confided-noupdatew.txt" using 2:xticlabels(1) fs pattern 3 lc rgb "dark-green" title "{/Bold=6 DRIVE (MeNU)}", \
	"overheads-reads-n-writes-iodedup-wupdatew.txt" using 2:xticlabels(1) fs pattern 4 lc rgb "dark-blue" title "{/Bold=6 IODEDUP (MeU)}", \
	"overheads-reads-n-writes-confided-wupdatew.txt" using 2:xticlabels(1) fs pattern 7 lc rgb "dark-green" title "{/Bold=6 DRIVE (MeU)}", \
	"overheads-reads-n-writes-iodedup-noupdatew.txt" using 2:xticlabels(1) fs pattern 10 lc rgb "dark-blue" title "{/Bold=6 IODEDUP (MeNU)}"
	
EOF

