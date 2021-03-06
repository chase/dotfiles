# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

alias git='noglob hub'
alias hg='noglob hg'
alias bower='noglob bower'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="chase"
DEFAULT_USER="chase"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
#export UPDATE_ZSH_DAYS=30

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

export _Z_CMD=j

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/.zsh-custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git mercurial bower dircycle golang docker npm systemd themes z)

# OH MY ZSH!
source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/vendor_perl:/usr/bin/core_perl"
LUA_PATH="/usr/share/lua/5.2/?.lua;/usr/share/lua/5.2/?/init.lua;/usr/lib/lua/5.2/?.lua;/usr/lib/lua/5.2/?/init.lua;./?.lua"
export LUA_PATH="/usr/local/share/lua/5.2/?.lua;/usr/local/share/lua/5.2/?/init.lua;/home/chase/.luarocks/share/lua/5.2/?.lua;/home/chase/.luarocks/share/lua/5.2/?/init.lua;$LUA_PATH"
LUA_CPATH="/usr/local/lib/lua/5.2/?.so;/home/chase/.luarocks/lib/lua/5.2/?.so;/usr/lib/lua/5.2/?.so;/usr/lib/lua/5.2/loadall.so;./?.so"
export LUA_CPATH="/usr/local/lib/lua/5.2/?.so;/home/chase/.luarocks/lib/lua/5.2/?.so;$LUA_CPATH"
# export MANPATH="/usr/local/man:$MANPATH"

export VAGRANT_DEFAULT_PROVIDER=docker
export GOPATH=~/go
export PATH="$PATH:$GOPATH/bin"

# Node Version Manger
[[ -s /usr/share/nvm/init-nvm.sh ]] && source /usr/share/nvm/init-nvm.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export EDITOR=vim
export BROWSER=chromium

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh

# Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias gsc='git clone --depth 1'
alias gcs='gsc'
alias xcopy='xclip -selection clipboard'
alias xpaste='xclip -selection clipboard -o'
alias tarball='tar -czf'

function ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Set zsh Terminal Title
chpwd () {print -Pn "\e]0;zsh: %~\a"}

# Undo frustrating oh-my-zsh completion options
# I like my tabbing on empty, thank you very much
setopt menu_complete
unsetopt complete_in_word
# <enter> selects menu and returns
bindkey -M menuselect '^M' accept-line.send-break
