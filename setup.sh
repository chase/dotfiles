#!/bin/sh
abspath=`pwd`
pushd -q janus
git submodule init && git submodule update
popd -q
ln -si $abspath/vimrc.before ~/.vimrc.before
ln -si $abspath/vimrc.after ~/.vimrc.after
ln -si $abspath/gvimrc.before ~/.gvimrc.before
ln -si $abspath/gvimrc.after ~/.gvimrc.after
[ -e ~/.janus ] && rm -rfI ~./janus; ln -s $abspath/janus ~/.janus
