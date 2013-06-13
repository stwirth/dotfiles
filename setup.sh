#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )" 
for f in `ls -A -I setup.sh -I .git`
do 
  ln -sv $DIR/$f ~/$f
done
