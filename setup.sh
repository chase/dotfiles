#!/usr/bin/zsh
abspath=`pwd`
echo -n "Setup vim files? (.vim and .vimrc will be removed) [N/y] " && read yesno
if [[ "$yesno:l" == "y" ]] {
    mkdir ~/.k
    [ -e ~/.vimrc ] && rm ~/.vimrc
    ln -s $abspath/vimrc ~/.vimrc
    [ -e ~/.vim ] && rm -rf ~/.vim
    ln -s $abspath/vim ~/.vim
    git submodule foreach git pull
    vim +NeoBundleInstall +qall
}
echo -n "Setup zsh files? (.zshrc and .zsh-custom will be removed) [N/y] " && read yesno
if [[ "$yesno:l" == "y" ]] {
    [ -e ~/.zsh-custom ] && rm -rf ~/zsh-custom
    ln -s $abspath/zsh-custom ~/.zsh-custom
    [ -e ~/.zshrc ] && rm ~/.zshrc
    ln -s $abspath/zshrc ~/.zshrc
}
echo -n "Setup git files? (.gitconfig will be removed) [N/y] " && read yesno
if [[ "$yesno:l" == "y" ]] {
    [ -e ~/.gitconfig ] && rm ~/.gitconfig
    ln -s $abspath/gitconfig ~/.gitconfig
}
