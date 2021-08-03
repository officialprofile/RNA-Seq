#!/bin/bash

featureCounts -p -s 2 -T 8 -t exon -a Homo_sapiens.GRCh38.99.gtf \
	-g gene_id -o counts2.txt BAM/*.bam
