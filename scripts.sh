# Remove junk.
#bcftools view -r chr1,chr2,chr3,chr4,chr5,chr6,chr7,chr8,chr9,chr10,chr11,chr12,chr13,chr14,chr15,chr16,chr17,chr18,chr19,chr20,chr21,chr22,chrX,chrY,chrM MVGWAHA73.mm2.sortdup.bqsr.hc.vcf.gz -o nojunk.vcf

#bcftools view -r chr1,chr2,chr3,chr4,chr5,chr6,chr7,chr8,chr9,chr10,chr11,chr12,chr13,chr14,chr15,chr16,chr17,chr18,chr19,chr20,chr21,chr22,chrX MVGWAHA73.mm2.sortdup.bqsr.hc.vcf.gz -o nojunk.vcf

# Keep only SNPs.
#bcftools view -v snps -m2 -M2 nojunk.vcf -o snps.vcf

# Keep variants that have an ID, appear in known databases and passed all filters.
#bcftools view -i 'ID!="." && INFO/DB==1 && FILTER=="."' snps.vcf -o common.vcf

# Keep only high quality variants.
bcftools view -i 'QUAL>30 && FORMAT/DP>10 && FS<10 && GQ>20 && MQ>30 && QD>2 && SOR<3' common.vcf -o quality.vcf

bcftools view -i 'QUAL>200 && FORMAT/DP>35 && FS<5 && GQ>50 && MQ>50 && QD>5 && SOR<2' quality.vcf -o high_quality.vcf

# Keep only common variants.
# bcftools view -i 'MAF>0.001' quality.vcf -o common.vcf
