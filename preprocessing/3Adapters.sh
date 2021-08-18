#!/bin/bash

mkdir -p cutadaptFASTQ

while read p; do \
  cutadapt -a CTGTCTCTTATA -A CTGTCTCTTATA \
  -o cutadaptFASTQ/"$p"_1.fastq.gz -p cutadaptFASTQ/"$p"_2.fastq.gz \
  FASTQ/"$p"_1.fastq.gz FASTQ/"$p"_2.fastq.gz; \
done < SRR_Acc_List.txt
