#!bin/bash

declare -r PAIRED_END=false
declare -r CLIP=1 	# 1 Truseq
			# 2 Nextera
			# 3 Skip adapter trimming
declare -r INPUT_DIRECTORY='cutadaptFASTQ'
declare -r OUTPUT_DIRECTORY='trimmomaticFASTQ'
declare COMMAND=''

mkdir -p "$OUTPUT_DIRECTORY"

while read p; do
	if [ "$PAIRED_END"=true ];
	then
		COMMAND+="TrimmomaticPE "
		COMMAND+="${INPUT_DIRECTORY}/${p}_1.fastq.gz "
		COMMAND+="${INPUT_DIRECTORY}/${p}_2.fastq.gz "
	else
		COMMAND+="TrimmomaticSE "
		COMMAND+="${INPUT_DIRECTORY}/${p}.fastq.gz "
	fi
	COMMAND+="-baseout ${OUTPUT_DIRECTORY}/${p}.fastq.gz "
	COMMAND+="LEADING:10 TRAILING:10 HEADCROP:5 "
	COMMAND+="SLIDINGWINDOW:4:15 MINLEN:40";
done < x.txt
echo "$COMMAND"
#eval "$COMMAND"

# $cat x.txt
# ABC123


