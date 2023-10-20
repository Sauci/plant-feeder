#!/usr/bin/env bash

cd /workdir

mkdir $HOME/build/conf
cp $HOME/sources/* $HOME/build/conf

source $POKY_BRANCH/oe-init-build-env $HOME/build

bitbake mesa --runall=fetch
