#!/bin/sh
abspath=`pwd`
pushd janus
git submodule init && git submodule update
popd
ln -si $abspath/vimrc.before ~/.vimrc.before
ln -si $abspath/vimrc.after ~/.vimrc.after
ln -si $abspath/gvimrc.before ~/.gvimrc.before
ln -si $abspath/gvimrc.after ~/.gvimrc.after
[ -d ~/.janus ] && rm -rfI ~./janus
ln -si $abspath/janus ~/.janus
