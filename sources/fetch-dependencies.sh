#!/usr/bin/env bash

cd /workdir

cp $HOME/sources/* $HOME/build/conf

source $POKY_BRANCH/oe-init-build-env $HOME/build

bitbake core-image-base --runall=fetch
