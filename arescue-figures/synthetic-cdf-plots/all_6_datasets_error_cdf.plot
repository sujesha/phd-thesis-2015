jpeg_type=1
eps_type=2
png_type=3

op_type=eps_type

if(op_type == eps_type) \
        set term postscript eps "Helvetica" 19 color enhanced
if(op_type == jpeg_type) \
        set term jpeg
if(op_type == png_type) \
        set term png medium

#set size 0.75, 0.35
set size 0.75, 0.75
#set title "`echo $GPFILETITLE`"
set key right bottom

#set xlabel "`echo $GPXLABEL`" 
set xlabel "Prediction error (% CPU utilization)" 
set ylabel "Cumulative Probability" 
set xrange [0:10]
set xtics 2
set ytics 0.1
set grid


#This variable GPFILENAME should be set from the shell script which 
#invokes gnuplot 

set output "`echo $GPFILENAME`"
#plot "`echo $GP_FILETOPLOT`" using 2:1 title "`echo $GPTITLE1`" with lines lt 4 lw 4

#Trying only for combivid:absolute:gray
plot "`echo $GP_FILETOPLOT`" using 2:1 title "`echo $GPTITLE1`" with lines lt 1 lw 4, "" using 4:3 title "`echo $GPTITLE2`" with lines lt 7 lw 4, "" using 6:5 title "`echo $GPTITLE3`" with linespoints lt 3 lw 2 pt 1, "" using 8:7 title "`echo $GPTITLE4`" with lines lt 5 lw 4, "" using 10:9 title "`echo $GPTITLE5`" with lines lt 8 lw 4, "" using 12:11 title "`echo $GPTITLE6`" with linespoints lt 11 lw 2 pt 6

#, "" using 14:13 title "`echo $GPTITLE7`" with lines, "" using 16:15 title "`echo $GPTITLE8`" with lines, "" using 18:17 title "`echo $GPTITLE9`" with lines, "" using 20:19 title "`echo $GPTITLE10`" with lines, "" using 22:21 title "`echo $GPTITLE11`" with lines, "" using 24:23 title "`echo $GPTITLE12`" with lines

