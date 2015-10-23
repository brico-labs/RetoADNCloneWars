#!/bin/bash

SRC='adn-cw.scad'
BIN='openscad'
DIR='../stl'

VER=$($BIN --version 2>&1)

[ $? -ne 1 ] && ( echo "$BIN not found" ; exit 1; )

echo $VER

while read ; do

	[[ $REPLY =~ ^([0-9]+)[\\t\ ](.+)$ ]]
	NUM=${BASH_REMATCH[1]}
        NAME=${BASH_REMATCH[2]}

	OUT="$DIR/$NUM.stl"
	echo "Generating $OUT"
	$BIN -o "$OUT" -D num="\"$NUM\"" -D name="\"$NAME\"" "$SRC"
done

