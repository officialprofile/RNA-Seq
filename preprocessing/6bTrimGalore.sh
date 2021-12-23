#!/bin/bash

while read p; do \
	~/TrimGalore-0.6.6/trim_galore --paired "$p"_1.fastq.gz "$p"_2.fastq.gz
	gzip -dk "$p"_1_val_1.fq.gz
	gzip -dk "$p"_2_val_2.fq.gz
done < lista.txt

#	STAR --runThreadN 12 --runMode alignReads \
#	--genomeDir index/STAR/ \
#	--readFilesIn "$p"_1_val_1.fq \
#	"$p"_2_val_2.fq \
#	--outSAMtype BAM SortedByCoordinate \
#	--outFileNamePrefix BAM/"$p$"; \

