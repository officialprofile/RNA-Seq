#!/bin/bash

mkdir kallisto_map

while read p; do \
  kallisto quant -i Bos_taurus.ARS-UCD1.2.idx \
  -o kallisto_map trimFASTQ/"$p"_1P.fastq trimFASTQ/"$p"_2P.fastq; \
done < list_files.txt
