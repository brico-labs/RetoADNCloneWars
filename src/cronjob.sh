#!/bin/bash

# paths
BASEDIR=$(dirname $0)
GIT="/usr/bin/git -C $BASEDIR"

# git+ssh environment
export HOME=/home/caligari
source $HOME/.ssh/agent/adn-cw.ssh-id

# update
$GIT pull 

# generate pruseotids
$BASEDIR/adn-cw.sh < $BASEDIR/adn-cw.list 

# generate sequence
$BASEDIR/sequence-update.sh

# send changes
$GIT add $BASEDIR/../*.stl 
$GIT commit -m "Partial generation."
#$GIT push 
