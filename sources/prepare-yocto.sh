#!/usr/bin/env bash

echo "$(whoami)"

cd /workdir

echo "sourcing $POKY_BRANCH/oe-init-build-env into $HOME/build"
source $POKY_BRANCH/oe-init-build-env $HOME/build

echo "copying /sources/bblayers.conf into $HOME/build/conf/bblayers.conf"
cp $HOME/sources/bblayers.conf $HOME/build/conf/bblayers.conf

echo "copying /sources/local.conf into $HOME/build/conf/local.conf"
cp $HOME/sources/local.conf $HOME/build/conf/local.conf

echo "building core-image-minimal"
bitbake -k core-image-minimal
