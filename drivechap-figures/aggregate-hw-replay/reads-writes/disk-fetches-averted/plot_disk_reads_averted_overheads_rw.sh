
gnuplot -persist <<EOF
set terminal pdf enhanced color font "Bold,8"
set output "readsaverted-overheads-reads-n-writes.pdf"
set size 1.0,0.8
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
set ylabel "number of disk reads \n averted" font "Bold,8"
plot "readsaverted-overheads-reads-n-writes-vanilla.txt" using 2:xticlabels(1) fs pattern 1 lc rgb "dark-red" title "{/Bold=6 Vanilla}", \
	"readsaverted-overheads-reads-n-writes-confided-noupdatew.txt" using 2:xticlabels(1) fs pattern 3 lc rgb "dark-green" title "{/Bold=6 DRIVE (MeNU)}", \
	"readsaverted-overheads-reads-n-writes-iodedup-wupdatew.txt" using 2:xticlabels(1) fs pattern 4 lc rgb "dark-blue" title "{/Bold=6 IODEDUP (MeU)}", \
	"readsaverted-overheads-reads-n-writes-confided-wupdatew.txt" using 2:xticlabels(1) fs pattern 9 lc rgb "dark-green" title "{/Bold=6 DRIVE (MeU)}", \
	"readsaverted-overheads-reads-n-writes-iodedup-noupdatew.txt" using 2:xticlabels(1) fs pattern 11 lc rgb "dark-blue" title "{/Bold=6 IODEDUP (MeNU)}"

EOF

