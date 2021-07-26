#!bin/bash

declare COMMAND=''

declare -r PAIRED_END="true"
declare -r CLIP=1 	# 1 Truseq
			# 2 Nextera
			# 3 Skip adapter trimming
declare -r leading=10
declare -r trailing=10
declare -r headcrop=5
declare -r slidingwindow="4:15"
declare -r minlen=40
declare -r illuminaclip="2:30:10"

declare -r INPUT_DIRECTORY='cutadaptFASTQ'
declare -r OUTPUT_DIRECTORY='trimmomaticFASTQ'

mkdir -p "$OUTPUT_DIRECTORY"

while read p; do
	if [ "$PAIRED_END" = "true" ];
	then
		COMMAND+="TrimmomaticPE "
		COMMAND+="${INPUT_DIRECTORY}/${p}_1.fastq.gz "
		COMMAND+="${INPUT_DIRECTORY}/${p}_2.fastq.gz "
		case "$CLIP" in
      			1 ) COMMAND+="ILLUMINACLIP:TruSeq3-PE-2.fa:${illuminaclip} " ;;
      			2 ) COMMAND+="ILLUMINACLIP:NexteraPE-PE-2.fa:${illuminaclip} "  ;;
      			3 ) echo " -- ADAPTER TRIMMING IS OFF --" ;; 
		esac
	else
		COMMAND+="TrimmomaticSE "
		COMMAND+="${INPUT_DIRECTORY}/${p}.fastq.gz "
		case "$CLIP" in
      			1 ) COMMAND+="ILLUMINACLIP:TruSeq3-SE-2.fa:${illuminaclip}  " ;;
      			2 ) COMMAND+="ILLUMINACLIP:NexteraSE-SE-2.fa:${illuminaclip} "  ;;
      			3 ) echo " -- ADAPTER TRIMMING IS OFF --" ;; 
		esac
	fi

	COMMAND+="-baseout ${OUTPUT_DIRECTORY}/${p}.fastq.gz "
	COMMAND+="LEADING:${leading} TRAILING:${trailing} HEADCROP:${headcrop} "
	COMMAND+="SLIDINGWINDOW:${slidingwindow} MINLEN:${minlen}";
done < x.txt
echo "$COMMAND"
#eval "$COMMAND"

# $cat x.txt
# ABC123


