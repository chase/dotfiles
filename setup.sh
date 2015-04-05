#!/bin/sh
git submodule foreach git pull
abspath=`pwd`
mkdir ~/.k
ln -si $abspath/vimrc ~/.vimrc
[ -d ~/.vim ] && rm -rfI ~/.vim
ln -si $abspath/vim ~/.vim
[ -d ~/.zsh-custom ] && rm -rfI ~/zsh-custom
ln -si $abspath/zsh-custom ~/.zsh-custom
ln -si $abspath/zshrc ~/.zshrc

vim +NeoBundleInstall +qall
