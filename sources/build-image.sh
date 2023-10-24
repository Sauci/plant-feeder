#!/usr/bin/env bash

cd /workdir

mkdir -p $HOME/build/conf
cp $HOME/sources/*.conf $HOME/build/conf
cp -r $HOME/sources/meta-watering-can-robot /workdir/$POKY_BRANCH

source $POKY_BRANCH/oe-init-build-env $HOME/build

bitbake watering-can-robot-minimal-image
