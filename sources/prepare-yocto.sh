#!/usr/bin/env bash

cd /workdir

source $POKY_BRANCH/oe-init-build-env $HOME/build

cp $HOME/sources/bblayers.conf $HOME/build/conf/bblayers.conf
cp $HOME/sources/local.conf $HOME/build/conf/local.conf

bitbake -k core-image-base
