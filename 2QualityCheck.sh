#!/bin/bash

mkdir -p FASTQC
for p in FASTQ/*.fastq.gz; do fastqc $p --outdir FASTQC; done

multiqc --outdir FASTQC FASTQC/.
