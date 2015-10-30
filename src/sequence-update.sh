#!/bin/bash

# config
GOOGLE_CALC='https://docs.google.com/spreadsheets/d/1CEc78IfhfzFyl3C44KGNHMy91A-xR38lpYUZox4AY-k/pub?gid=0&single=true&output=tsv'

# paths
BASEDIR=$(dirname $0)
OPENSCAD='/usr/bin/openscad'
MD5='/usr/bin/md5sum'
WGET='/usr/bin/wget'
DATA_TMP='/tmp/pruseotidos.tsv'
DATA="$BASEDIR/sequence-data-test.scad"

# checkpoint
[ -e $DATA ] && BEFORE=$($MD5 $DATA)

#LOG=$($WGET --progress=dot --server-response --output-document=$DATA_TMP $GOOGLE_CALC 2>&1)
#if [ $? -ne 0 ] ; then 
#	echo "ERROR: Wget failed to get Google Calc"
#	echo "$LOG"
#	exit 1
#fi

# template before
echo "pair_data = ["

# parse pruseotidos
DATA_SIZE=0
cut -f1,3,8 $TSV | while read ; do

	#echo $REPLY

	# matches number and name
	if [[ "$REPLY" =~ ^([0-9]+)[[:space:]]SI[[:space:]]([^[:space:]]+) ]] ; then

		NUMBER=${BASH_REMATCH[1]}
		COLOR=${BASH_REMATCH[2]}

		echo "[$NUMBER, \"$COLOR\"],"

		DATA_SIZE=$((DATA_SIZE += 1))
	fi

done

# template before
echo "[]];"
echo "pair_data_size = $DATA_SIZE;"


exit

# checkpoint
AFTER=$($MD5 $DATA)

// test data has changed
if [ $BEFORE != $AFTER ] ; then

	# generate OpenSCAD view

fi





