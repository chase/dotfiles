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
Plug 'gregsexton/gitv'
Plug 'Shougo/vimfiler.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch' " :SudoEdit/SudoWrite

" Convert to camelCase (crc), dash-case (cr-)
" :Subvert/object{,s}/class{,}/g
Plug 'tpope/vim-abolish'

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
Plug '~/Development/vim-react-snippets'

" {{{ Languages
Plug 'sheerun/vim-polyglot'
Plug 'leafo/moonscript-vim'
" }}}

" Code assist
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', {'do': function('DoRemote')} |
      \Plug 'zchee/deoplete-go', {'do': 'make'}
Plug 'osyo-manga/vim-marching'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-endwise'
Plug '~/Development/splitjoin.vim'

" Deoplete sources
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
Plug 'zchee/deoplete-jedi' " Python

call plug#end()
