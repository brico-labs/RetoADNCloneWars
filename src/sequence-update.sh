#!/bin/bash

# config
GOOGLE_CALC='https://docs.google.com/spreadsheets/d/1CEc78IfhfzFyl3C44KGNHMy91A-xR38lpYUZox4AY-k/pub?gid=0&single=true&output=tsv'

# paths
BASEDIR=$(dirname $0)
OPENSCAD='/usr/bin/openscad'
MD5='/usr/bin/md5sum'
WGET='/usr/bin/wget'
DATA_TMP='/tmp/pruseotidos.tsv'
DATA="$BASEDIR/pruseotidos.tsv"

# checkpoint
[ -e $DATA ] && BEFORE=$($MD5 $DATA)

LOG=$($WGET --progress=dot --server-response --output-document=$DATA_TMP $GOOGLE_CALC 2>&1)
if [ $? -ne 0 ] ; then 
	echo "ERROR: Wget failed to get Google Calc"
	echo "$LOG"
	exit 1
fi

# parse pruseotidos
cat $TSV | while [ read ] ; do

	# matches number and name
	if [[ $REPLY =~ ^([0-9]+)\\t([^\\t]+) ]] ; then

		NUM=${BASH_REMATCH[1]}
		NAME=${BASH_REMATCH[2]}

		echo "Filtering: $NUM $NAME"

	fi

done

# checkpoint
AFTER=$($MD5 $DATA)





