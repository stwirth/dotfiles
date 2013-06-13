#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )" 
for f in `ls -A -I setup.sh`
do 
  ln -sv $DIR/$f ~/$f
done
