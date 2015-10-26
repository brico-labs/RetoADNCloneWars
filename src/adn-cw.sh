#!/bin/bash

SRC='adn-cw.scad'
DIR='../stl'

VER=$($OPENSCAD --version 2>&1)

[ $? -ne 1 ] && ( echo "$BIN not found" ; exit 1; )

echo $VER

while read ; do

	[[ $REPLY =~ ^([0-9]+)[\\t\ ](.+)$ ]]
	NUM=${BASH_REMATCH[1]}
        NAME=${BASH_REMATCH[2]}

	OUT="$DIR/$NUM.stl"
	if [ ! -f $OUT ] ; then

		echo "Generating $OUT"
		$OPENSCAD -o "$OUT" -D num="\"$NUM\"" -D name="\"$NAME\"" "$SRC"

	fi
done

