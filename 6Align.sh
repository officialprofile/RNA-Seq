#!/bin/bash

while read p; do \
	gzip -dk bash_Trim_Reads/"$p"_trmd_1P.fastq.gz
	gzip -dk bash_Trim_Reads/"$p"_trmd_2P.fastq.gz
	STAR --runThreadN 12 --runMode alignReads \
	--genomeDir STAR/ \
	--readFilesIn bash_Trim_Reads/"$p"_trmd_1P.fastq \
	bash_Trim_Reads/"$p"_trmd_2P.fastq \
	--outSAMtype BAM SortedByCoordinate \
	--outFileNamePrefix BAM/"$p$"; \
done < SRR_Acc_List.txt
