jpeg_type=1
eps_type=2
png_type=3

op_type=eps_type

if(op_type == eps_type) \
        set term postscript eps "Helvetica" 18
if(op_type == jpeg_type) \
        set term jpeg
if(op_type == png_type) \
        set term png medium

#set size 0.75, 0.35
set size 0.65, 0.45
#set size 0.75, 0.75


set title "`echo $GPFILETITLE`"

set xlabel "`echo $GPXLABEL`" 
set ylabel "`echo $GPYLABEL`" 
#set ylabel "Co-hosted CPU (%)" 
set yrange [0:80]
set xrange [0:32]
set ytics 20
#set xtics "`echo $GPXTICS`"
#set xtics 100
#set ytics 10
set grid


#This variable GPFILENAME should be set from the shell script which 
#invokes gnuplot 

set output "`echo $GPFILENAME`"
#plot "`echo $GP_FILETOPLOT`" using 1:2 title "`echo $GPTITLE1`" with linespoints, "" using 1:3 title "`echo $GPTITLE2`" with linespoints
plot "`echo $GP_FILETOPLOT`" using 1:2 title "`echo $GPTITLE1`" with linespoints lt 3 lw 4 pt 2, "" using 1:3 title "`echo $GPTITLE2`" with lines lt 1 lw 4
