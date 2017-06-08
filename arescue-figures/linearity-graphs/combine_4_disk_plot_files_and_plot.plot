#Related to scripted.combine_4_aff_plot_files_and_plot.sh
#Useful for forward and reverse plots of both affine and non-affine, though the name suggests aff only
#Also used for scripted.combine_4_disk_plot_files_and_plot.sh (because read -> Rx, write -> Tx)

jpeg_type=1
eps_type=2
png_type=3

op_type=eps_type

if(op_type == eps_type) \
        set term postscript eps "Helvetica 18"
if(op_type == jpeg_type) \
        set term jpeg
if(op_type == png_type) \
        set term png medium

#set size 0.75, 0.35
set size 0.75, 0.75

#set title "`echo $GPFILETITLE`"

set xlabel "`echo $GPXLABEL`" 

set ylabel "`echo $GPYLABEL`" 

set xrange [0:]
set yrange [0:45]
#set xrange [0:40]
#set yrange [0:40]
#set xtics 20000
#set ytics 0.2
set grid
set pointsize 2
set key right
#set xtics "`echo $GPXTICS`"


set output "`echo $GPFILENAME`"
plot "`echo $GP_FILETOPLOT`" using 1:2 title "`echo $GPTITLE1`" with linespoints lt 1 lw 4 pt 2, "" using 3:4 title "`echo $GPTITLE2`" with linespoints lt 1 lw 4 pt 7, "" using 5:6 title "`echo $GPTITLE3`" with linespoints lt 2 lw 4 pt 2, "" using 7:8 title "`echo $GPTITLE4`" with linespoints lt 2 lw 4 pt 7

#COLOR 
#plot "`echo $GP_FILETOPLOT`" using 1:2 title "`echo $GPTITLE1`" with linespoints lt 2 lc rgb "dark-blue" lw 5 pt 6, "" using 3:4 title "`echo $GPTITLE2`" with linespoints lt 2 lc rgb "dark-red" lw 5 pt 4, "" using 5:6 title "`echo $GPTITLE3`" with linespoints lt 2 lc rgb "dark-blue" lw 5 pt 6, "" using 7:8 title "`echo $GPTITLE4`" with linespoints lt 2 lc rgb "dark-red" lw 5 pt 4
