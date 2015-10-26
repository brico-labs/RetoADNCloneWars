#!/bin/bash

# paths
BASEDIR=$(dirname $0)
OPENSCAD=/usr/bin/openscad

# parameters and defaults
SRC=${1-$BASEDIR/adn-cw.scad}
DIR=${2-$BASEDIR/../stl}

# OpenSCAD is installed
VER=$($OPENSCAD --version 2>&1)
[ $? -ne 0 ] && ( echo "$OPENSCAD not found" ; exit 1; )
echo $VER

# input is stdin
while read ; do

	# number and name by line
	[[ $REPLY =~ ^([0-9]+)[\\t\ ](.+)$ ]]
	NUM=${BASH_REMATCH[1]}
        NAME=${BASH_REMATCH[2]}

	# output file
	OUT="$DIR/$NUM.stl"

	# when not exists
	if [ ! -f $OUT ] ; then

		# generate new stl
		echo "Generating $OUT"
		$OPENSCAD -o "$OUT" -D num="\"$NUM\"" -D name="\"$NAME\"" "$SRC"

	fi
done

