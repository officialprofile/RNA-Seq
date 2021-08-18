#!/bin/bash

#TruSeq3-PE-2.fa
#NexteraPE-PE.fa
#cutadaptFASTQ/"$p"_1.fastq.gz \
#cutadaptFASTQ/"$p"_2.fastq.gz \
#ILLUMINACLIP:TruSeq3-PE-2.fa:2:30:10 \

mkdir -p trimmomaticFASTQ

while read p; do \
	TrimmomaticPE \
	cutadaptFASTQ/"$p"_1.fastq.gz \
	cutadaptFASTQ/"$p"_2.fastq.gz \
	-baseout trimmomaticFASTQ/"$p".fastq.gz \
	LEADING:10 \
	TRAILING:10 \
	HEADCROP:5 \
	SLIDINGWINDOW:4:15 \
	MINLEN:40;\
done < SRR_Acc_List.txt
