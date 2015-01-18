#!/bin/sh
abspath=`pwd`
pushd janus
git submodule init && git submodule update
popd
ln -si $abspath/vimrc.before ~/.vimrc.before
ln -si $abspath/vimrc.after ~/.vimrc.after
[ -d ~/.janus ] && rm -rfI ~/.janus
ln -si $abspath/janus ~/.janus
[ -d ~/.zsh-custom ] && rm -rfI ~/zsh-custom
ln -si $abspath/zsh-custom ~/.zsh-custom
ln -si $abspath/zshrc ~/.zshrc
