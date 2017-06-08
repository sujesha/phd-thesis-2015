#!/bin/sh

column=2	#CPU stats

for keyword in "wronly-by-rate-lowrates"
do
	#Generated load
	cut -d " " -f 5 generic-input-file-firstVM."$keyword".sequential.sss.txt > firstVM_gen
	cut -d " " -f 5 generic-input-file-secondVM."$keyword".sequential.sss.txt > secondVM_gen

	cut -d "," -f 11 "$keyword"-final-metrics_diffdiff_VM1 > firstVM_gen_actual
	cut -d "," -f 11 "$keyword"-final-metrics_diffdiff_VM2 > secondVM_gen_actual

	#constructing
	paste -d "," firstVM_gen secondVM_gen firstVM_gen_actual secondVM_gen_actual > temp_data
	mv temp_data "$keyword"-benchmark-data

	#Diff-diff load observed in VM1
	cut -d "," -f "$column" "$keyword"-final-metrics_diffdiff_VM1 > firstVM_dispersed
	paste -d ";" "$keyword"-benchmark-data firstVM_dispersed > temp_data
	mv temp_data "$keyword"-benchmark-data

	#Diff-diff load observed in VM2
	cut -d "," -f "$column" "$keyword"-final-metrics_diffdiff_VM2 > secondVM_dispersed
	paste -d "," "$keyword"-benchmark-data secondVM_dispersed > temp_data
	mv temp_data "$keyword"-benchmark-data

	#Diff-diff load observed in PM1
	cut -d "," -f "$column" "$keyword"-final-metrics_diffdiff_PM1 > firstdom0_dispersed
	#Diff-diff load observed in PM2
	cut -d "," -f "$column" "$keyword"-final-metrics_diffdiff_PM2 > seconddom0_dispersed
	#Summation of the diff-diff dom0
	paste firstdom0_dispersed seconddom0_dispersed > temp_for_summation
	add-2-columns-rowwise.sh temp_for_summation > summation-dispersed-dom0
	paste -d ";" "$keyword"-benchmark-data summation-dispersed-dom0 > temp_data
	mv temp_data "$keyword"-benchmark-data

	#Same-diff load observed in VM1
	cut -d "," -f "$column" "$keyword"-final-metrics_samediff_VM1 > firstVM_colocated
	paste -d ";" "$keyword"-benchmark-data firstVM_colocated > temp_data
	mv temp_data "$keyword"-benchmark-data

	#Same-diff load observed in VM2
	cut -d "," -f "$column" "$keyword"-final-metrics_samediff_VM2 > secondVM_colocated
	paste  -d "," "$keyword"-benchmark-data secondVM_colocated > temp_data
	mv temp_data "$keyword"-benchmark-data


	#Same-diff load observed in PM1
	cut -d "," -f "$column" "$keyword"-final-metrics_samediff_PM1 > colocated-dom0
	paste -d ";" "$keyword"-benchmark-data colocated-dom0 > temp_data
	mv temp_data "$keyword"-benchmark-data
	
	echo "Output is "$keyword"-benchmark-data"

done	


