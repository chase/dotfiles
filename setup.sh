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

source zsh-custom/dnvm/kvm.sh

vim +NeoBundleInstall +qall && \
pushd ~/.vim/bundle/omnisharp-vim/omnisharp-roslyn && \
./build.sh || ./build.sh && \
popd
