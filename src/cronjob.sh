#!/bin/bash

# paths
BASEDIR=$(dirname $0)
GIT="/usr/bin/git -C $BASEDIR"

# git+ssh environment
export HOME=/home/caligari
source $HOME/.ssh/agent/adn-cw.ssh-id

# update
$GIT pull 

# generate
$BASEDIR/adn-cw.sh < $BASEDIR/adn-cw.list 

# send changes
$GIT add $BASEDIR/../*.stl 
$GIT commit -m "Partial generation."
$GIT push 
