" vim: foldmethod=marker foldlevel=0
call plug#begin(expand('~/.config/nvim/plugged'))

" Colorscheme
Plug 'chase/focuspoint-vim'

" Libraries
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'Shougo/unite.vim'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'mattn/webapi-vim'

" Display
Plug 'bling/vim-airline' | Plug 'chase/vim-airline-focuspoint'
Plug 'junegunn/goyo.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ap/vim-css-color'
Plug 'roryokane/detectindent'

" Tools
Plug 'tpope/vim-fugitive', {'as': 'fugitive'}
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/vimfiler.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch' " :SudoEdit/SudoWrite

" Error checks
Plug 'benekastah/neomake'

" Motion
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'edsono/vim-matchit'
Plug 'michaeljsmith/vim-indent-object'
Plug 'thinca/vim-visualstar'

" Search
Plug 'rking/ag.vim'

" Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" {{{ Languages
Plug 'tpope/vim-git'
Plug 'fatih/vim-go'
Plug 'leafo/moonscript-vim'

Plug 'kchmck/vim-coffee-script'

Plug 'pangloss/vim-javascript' | Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'

Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-haml'

Plug 'groenewege/vim-less'
Plug 'cakebaker/scss-syntax.vim'

Plug 'ajf/puppet-vim'

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-cucumber'
Plug 'sunaku/vim-ruby-minitest', {'for': 'ruby'}
Plug 'tpope/vim-rails', {'for': 'ruby'}
Plug 'skwp/vim-rspec', {'for': 'ruby'}
Plug 'depuracao/vim-rdoc', {'for': 'ruby'}

Plug 'tpope/vim-markdown'
Plug 'timcharper/textile.vim'
" }}}

" Code assist
Plug 'Shougo/deoplete.nvim' |
      \Plug 'zchee/deoplete-go', {'do': 'make'}
Plug 'osyo-manga/vim-marching'
Plug 'mattn/emmet-vim'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-endwise'
call plug#end()

if filereadable(expand("~/.config/nvim/plugins.vim"))
  source ~/.config/nvim/plugins.vim
endif
