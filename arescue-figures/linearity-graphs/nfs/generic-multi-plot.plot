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


set title "`echo $GPFILETITLE`"

set xlabel "`echo $GPXLABEL`" 

set ylabel "`echo $GPYLABEL`" 

set xrange [0:]
set yrange [0:]
#set xrange [0:40]
#set yrange [0:40]
#set xtics 0.2
#set ytics 0.2
set grid

#set xtics "`echo $GPXTICS`"


set output "`echo $GPFILENAME`"


plot "`echo $GP_FILETOPLOT`" using 1:2 title "`echo $GPTITLE1`" with linespoints, "" using 3:4 title "`echo $GPTITLE2`" with linespoints, "" using 5:6 title "`echo $GPTITLE3`" with linespoints, "" using 7:8 title "`echo $GPTITLE4`" with linespoints
