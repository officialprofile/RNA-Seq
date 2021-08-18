#!/bin/bash

mkdir -p FASTQ 
while read p; do \
 fastq-dump --gzip --split-files ${p} --outdir FASTQ; \
done <SRR_Acc_List.txt

## Alternatywa dla plików już ściągniętych
# fastq-dump --gzip --split-files sra/SRR13057920.sra
