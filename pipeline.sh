#!/bin/sh

input_filename=$1
output_filename="${input_filename}_23andme.txt"

# Extract fields with bcftools
bcftools query -f '%ID\t%CHROM\t%POS\t%REF%ALT\n' $input_filename.vcf > $output_filename

# Adjust columns with awk (if needed)
#awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5}' output_23andme.txt > formatted_output.txt

# Rename chromosomes if necessary
sed -i 's/chr//g' $output_filename
sed -i 's/M/MT/g' $output_filename

# Compress the final output if needed
bgzip -kf $output_filename
