#!/usr/bin/zsh
abspath=`pwd`
if type nvim; then
    echo -n "Setup nvim files? (.nvim, .nvimrc, and .config/nvim will be removed) [N/y] " && read yesno
    if [[ "$yesno:l" == "y" ]] {
        [ -e ~/.config/nvim ] && rm -rf ~/.config/nvim
        [ -e ~/.nvimrc ] && rm ~/.nvimrc
        [ -e ~/.nvim ] && rm -rf ~/.nvim
        mkdir -p ~/.config/nvim/bundle
        for file in $abspath/nvim/*; { ln -s $file ~/.config/nvim/; }
        git clone https://github.com/Shougo/neobundle.vim ~/.config/nvim/bundle/neobundle.vim
        nvim -N -u ~/.config/nvim/init.vim -c 'try | NeoBundleInstall | finally | qall! | endtry' -U NONE -i NONE -e -s
        nvim +'silent UpdateRemotePlugins' +qall
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
echo -n "Setup .Xdefaults? (.Xdefaults will be removed) [N/y] " && read yesno
if [[ "$yesno:l" == "y" ]] {
    [ -e ~/.Xdefaults ] && rm ~/.Xdefaults
    ln -s $abspath/Xdefaults ~/.Xdefaults
}
