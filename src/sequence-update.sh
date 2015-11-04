#!/bin/bash

# config
GOOGLE_CALC='https://docs.google.com/spreadsheets/d/1CEc78IfhfzFyl3C44KGNHMy91A-xR38lpYUZox4AY-k/pub?gid=0&single=true&output=tsv'
IMG_WIDTH=640
IMG_HEIGHT=2000

# paths
BASEDIR="$(dirname $0)"
OPENSCAD='/usr/bin/openscad'
MD5='/usr/bin/md5sum'
CUT='/usr/bin/cut'
WGET='/usr/bin/wget'
DATA_TMP='/tmp/pruseotidos.tsv'
SCAD="$BASEDIR/sequence.scad"
DATA="$BASEDIR/sequence-data.scad"
PNG_VIEW="$BASEDIR/sequence.png"


# checkpoint
[ -e $DATA ] && BEFORE=$($MD5 $DATA)

LOG=$($WGET --progress=dot --server-response --output-document=$DATA_TMP $GOOGLE_CALC 2>&1)
if [ $? -ne 0 ] ; then 
	echo "ERROR: Wget failed to get Google Calc"
	echo "$LOG"
	exit 1
fi

# template before
echo "pair_data = [" > $DATA

# parse pruseotidos
$CUT -f1,3,8 $DATA_TMP | while read ; do

	# match number and color
	if [[ "$REPLY" =~ ^([0-9]+)[[:space:]]SI[[:space:]]([A-Za-z]+) ]] ; then

		NUMBER=${BASH_REMATCH[1]}
		COLOR=${BASH_REMATCH[2]}

		echo -e "\t[$NUMBER, \"$COLOR\"]," >> $DATA
	fi

done

# template after
echo -e "\t[]];" >> $DATA

# checkpoint
AFTER=$($MD5 $DATA)

# test data has changed
if [ "$BEFORE" != "$AFTER" ] ; then

	# generate OpenSCAD view
#	echo "Generating new OpenSCAD view ($IMG_WIDTH x $IMG_HEIGHT): $PNG_VIEW"
#	$OPENSCAD --imgsize=$IMG_WIDTH,$IMG_HEIGHT -o $PNG_VIEW $SCAD
fi





