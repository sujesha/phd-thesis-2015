jpeg_type=1
eps_type=2
png_type=3

op_type=png_type

if(op_type == eps_type) \
        set term postscript eps color
if(op_type == jpeg_type) \
        set term jpeg
if(op_type == png_type) \
		set term png medium

#set size 0.75, 0.35
set size 0.75, 0.75
set origin 0.0,0.0

#set title "`echo $GPFILETITLE`" font "Arial,20"
#set xlabel "`echo $GPXLABEL`" font "Helvetica,20"
#set ylabel "`echo $GPYLABEL`" font "Helvetica,20"
set title "`echo $GPFILETITLE`"
set xlabel "`echo $GPXLABEL`"
set ylabel "`echo $GPYLABEL`"

#set xrange [0:40]
#set yrange [0:40]
set xrange [0:]
set yrange [0:]
#set xtics 0.2
#set ytics 0.2
set grid

#set xtics "`echo $GPXTICS`"


set output "`echo $GPFILENAME`"
plot "`echo $GP_FILETOPLOT`" title "`echo $GPYLABEL`" with linespoints
#plot "`echo $GP_FILETOPLOT`" title "Colocated Dom0 CPU" with linespoints


#plot "`echo $GP_FILETOPLOT`" using 1:2 title "`echo $GPTITLE1`" with points, "" using 1:3 title "`echo $GPTITLE2`" with points
