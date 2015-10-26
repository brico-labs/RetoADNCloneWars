#!/bin/bash

export OPENSCAD=/usr/bin/openscad
export HOME=/home/caligari
GIT=/usr/bin/git

. $HOME/.ssh/agent/adn-cw.ssh-id

BASEDIR=$(dirname $0)
cd $BASEDIR

$GIT pull 
$BASEDIR/adn-cw.sh < $BASEDIR/adn-cw.list 
$GIT add $BASEDIR/../*.stl 
$GIT commit -m "Partial generation." ; 
$GIT push 
