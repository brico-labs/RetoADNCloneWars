#!/bin/bash

SRC='adn-cw.scad'
BIN='openscad'

VER=$($BIN --version 2>&1)

[ $? -ne 1 ] && ( echo "$BIN not found" ; exit 1; )

echo $VER

while read ; do
	ACTG="$REPLY"
	OUT=$(echo "$ACTG.stl" | tr ' ' '_')
	echo "Generating $OUT"
	$BIN -o "$OUT" -D actg='"#$ACTG"' "$SRC"
done

