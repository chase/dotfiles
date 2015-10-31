call neobundle#begin(expand('~/.config/nvim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" Libraries
NeoBundle 'Shougo/vimproc.vim', {'build':{'linux': 'make'}}
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'mattn/webapi-vim'

" Display
NeoBundle 'bling/vim-airline'
NeoBundle 'junegunn/goyo.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'ap/vim-css-color'
NeoBundle 'roryokane/detectindent'

" Tools
NeoBundle 'tpope/vim-fugitive', { 'augroup' : 'fugitive' }
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-eunuch' " :SudoEdit/SudoWrite

" Error checks
NeoBundle 'benekastah/neomake'

" Motion
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-surround'
NeoBundle 'edsono/vim-matchit'
NeoBundle 'michaeljsmith/vim-indent-object'
NeoBundle 'thinca/vim-visualstar'

" Code assist
NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'osyo-manga/vim-marching'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-endwise'

" Search
NeoBundle 'rking/ag.vim'

" {{{ Languages
NeoBundle 'tpope/vim-git'
NeoBundle 'fatih/vim-go'
NeoBundle 'leafo/moonscript-vim'

NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mmalecki/vim-node.js'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'elzr/vim-json'

NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'tpope/vim-haml'

NeoBundle 'groenewege/vim-less'
NeoBundle 'cakebaker/scss-syntax.vim'

NeoBundle 'ajf/puppet-vim'

NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'sunaku/vim-ruby-minitest'
NeoBundle 'tpope/vim-rails'
NeoBundle 'skwp/vim-rspec'

NeoBundle 'depuracao/vim-rdoc'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'timcharper/textile.vim'
" }}}

" Colorscheme
NeoBundle 'chase/focuspoint-vim'
NeoBundle 'chase/vim-airline-focuspoint'

call neobundle#end()
