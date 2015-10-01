#!/usr/bin/zsh
abspath=`pwd`
if type nvim; then
    echo -n "Setup nvim files? (.nvim and .nvimrc will be removed) [N/y] " && read yesno
    if [[ "$yesno:l" == "y" ]] {
        [ -e ~/.nvimrc ] && rm ~/.nvimrc
        ln -s $abspath/nvimrc ~/.nvimrc
        [ -e ~/.nvim ] && rm -rf ~/.nvim
        mkdir -p ~/.nvim/bundle
        git clone https://github.com/Shougo/neobundle.vim ~/.nvim/bundle/neobundle.vim
        nvim +NeoBundleInstall +qall
        nvim +UpdateRemotePlugins +qall
    }
fi
echo -n "Setup vim files? (.vim and .vimrc will be removed) [N/y] " && read yesno
if [[ "$yesno:l" == "y" ]] {
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
