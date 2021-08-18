#!/bin/bash
# http://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARgenomes/Human/GRCh38_Ensembl99_sparseD3_sjdbOverhang99/

STAR --runThreadN 128 --runMode genomeGenerate --genomeDir STAR \
	--genomeFastaFiles STAR/Homo_sapiens.GRCh38.dna.primary_assembly.fa \
	--sjdbGTFfile STAR/Homo_sapiens.GRCh38.99.gtf
