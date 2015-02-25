#!/usr/bin/zsh
abspath=`pwd`
echo -n "Setup vim files? (.vim and .vimrc will be removed) [N/y] " && read yesno
if [[ "$yesno:l" -eq "y" ]] {
    [ -e ~/.vimrc ] && rm ~/.vimrc
    ln -s $abspath/vimrc ~/.vimrc
    [ -d ~/.vim ] && rm -rf ~/.vim
    ln -s $abspath/vim ~/.vim
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
    vim +NeoBundleInstall +qall
}
echo -n "Setup zsh files? (.vim and .vimrc will be removed) [N/y] " && read yesno
if [[ "$yesno:l" -eq "y" ]] {
    [ -d ~/.zsh-custom ] && rm -rf ~/zsh-custom
    ln -s $abspath/zsh-custom ~/.zsh-custom
    [ -e ~/.zshrc ] && rm ~/.zshrc
    ln -s $abspath/zshrc ~/.zshrc
}
