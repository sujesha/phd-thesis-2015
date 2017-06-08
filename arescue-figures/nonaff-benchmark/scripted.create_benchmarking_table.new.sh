#!/bin/sh

column=2	#CPU stats

for keyword in "bytetcp-nonaffonly-highrates"
do
	#Generated load
	cut -d " " -f 6 bytetcp-nonaffonly-highrates-executed.list > firstVM_gen
	cut -d " " -f 10 bytetcp-nonaffonly-highrates-executed.list > secondVM_gen
	cut -d " " -f 14 bytetcp-nonaffonly-highrates-executed.list > EXT_VM1_gen
	cut -d " " -f 18 bytetcp-nonaffonly-highrates-executed.list > EXT_VM2_gen

	#constructing
	paste -d "," firstVM_gen secondVM_gen EXT_VM1_gen EXT_VM2_gen > temp_data
	mv temp_data "$keyword"-benchmark-data

	#Diff-diff load observed in VM1
	cut -d "," -f "$column" bytetcp-nonaffonly-highrates-final-metrics_diffdiff_VM1 > firstVM_dispersed
	paste -d ";" "$keyword"-benchmark-data firstVM_dispersed > temp_data
	mv temp_data "$keyword"-benchmark-data

	#Diff-diff load observed in VM2
	cut -d "," -f "$column" bytetcp-nonaffonly-highrates-final-metrics_diffdiff_VM2 > secondVM_dispersed
	paste -d "," "$keyword"-benchmark-data secondVM_dispersed > temp_data
	mv temp_data "$keyword"-benchmark-data

	#Diff-diff load observed in PM1
	cut -d "," -f "$column" bytetcp-nonaffonly-highrates-final-metrics_diffdiff_PM1 > firstdom0_dispersed
	#Diff-diff load observed in PM2
	cut -d "," -f "$column" bytetcp-nonaffonly-highrates-final-metrics_diffdiff_PM2 > seconddom0_dispersed
	#Summation of the diff-diff dom0
	paste firstdom0_dispersed seconddom0_dispersed > temp_for_summation
	add-2-columns-rowwise.sh temp_for_summation > summation-dispersed-dom0
	paste -d ";" "$keyword"-benchmark-data summation-dispersed-dom0 > temp_data
	mv temp_data "$keyword"-benchmark-data

	#Same-diff load observed in VM1
	cut -d "," -f "$column" bytetcp-nonaffonly-highrates-final-metrics_samediff_VM1 > firstVM_colocated
	paste -d ";" "$keyword"-benchmark-data firstVM_colocated > temp_data
	mv temp_data "$keyword"-benchmark-data

	#Same-diff load observed in VM2
	cut -d "," -f "$column" bytetcp-nonaffonly-highrates-final-metrics_samediff_VM2 > secondVM_colocated
	paste  -d "," "$keyword"-benchmark-data secondVM_colocated > temp_data
	mv temp_data "$keyword"-benchmark-data

	#Same-diff load observed in PM1
	cut -d "," -f "$column" bytetcp-nonaffonly-highrates-final-metrics_samediff_PM1 > colocated-dom0
	paste -d ";" "$keyword"-benchmark-data colocated-dom0 > temp_data
	mv temp_data "$keyword"-benchmark-data

done	


echo "Output is "$keyword"-benchmark-data"
