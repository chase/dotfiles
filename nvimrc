" vim: foldmethod=marker
" Note: Skip initialization for vim-tiny or vim-small
if !1 | finish | endif

if has('vim_starting')
    if &compatible
        set nocompatible
    endif

    set runtimepath+=~/.nvim/bundle/neobundle.vim/
    set runtimepath+=~/.nvim/hilinks/
endif

let mapleader = ","
set nowrap
set nosmarttab
set shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab textwidth=0
set diffopt+=vertical
set foldmethod=indent foldnestmax=2 foldlevelstart=1
set mouse=a

" {{{ Plugin Settings
let g:vim_json_syntax_conceal = 0
let g:jsx_ext_required = 0
let g:vim_json_syntax_conceal = 0
let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0
let g:gitgutter_signs = 0

" Go! {{{
let g:go_auto_type_info = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
" }}}
" {{{ Deoplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use deoplete.
let g:deoplete#enable_at_startup = 1
" Use smartcase.
let g:deoplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:deoplete#sources#syntax#min_keyword_length = 3
let g:deoplete#enable_fuzzy_completion = 0

" Shell style
let g:deoplete#enable_auto_select = 0
let g:deoplete#disable_auto_complete = 1
let g:deoplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:deoplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist'
\ }

" Define keyword.
if !exists('g:deoplete#keyword_patterns')
    let g:deoplete#keyword_patterns = {}
endif
let g:deoplete#keyword_patterns['default'] = '\h\w*'

" Clang support
let g:marching_clang_command = "/usr/bin/clang"
let g:marching_enable_deoplete = 1

if !exists('g:deoplete#force_omni_input_patterns')
    let g:deoplete#force_omni_input_patterns = {}
endif

let g:deoplete#force_omni_input_patterns.go =
    \ '[^.[:digit:] *\t]\.'

let g:deoplete#force_omni_input_patterns.cpp =
    \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

let g:deoplete#force_omni_input_patterns.python =
    \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" }}}
" {{{ iPython
let g:ipy_perform_mappings = 0
let g:ipy_completefunc = 'local'
" }}}
" {{{ Tagbar
let g:tagbar_type_coffee = {
    \ 'ctagstype' : 'coffee',
    \ 'kinds'     : [
        \ 't:gulp tasks',
        \ 'v:variables',
        \ 'f:functions',
        \ 'c:classes',
        \ 'm:methods',
        \ 's:static properties',
        \ 'p:properties',
    \ ]
\ }
let g:tagbar_type_moon = {
    \ 'ctagstype' : 'moonscript',
    \ 'kinds'     : [
        \ 'v:variables',
        \ 'f:functions',
        \ 'c:classes',
        \ 'm:methods',
        \ 's:static properties',
        \ 'p:properties',
    \ ]
\ }
" }}}
" {{{ Vimfiler
let g:vimfiler_tree_leaf_icon = "┊"
let g:vimfiler_tree_opened_icon = "▼"
let g:vimfiler_tree_closed_icon = "▶"
let g:vimfiler_readonly_file_icon = ""
let g:vimfiler_marked_file_icon = "▪"
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_enable_auto_cd = 1
let g:vimfiler_safe_mode_by_default = 0
" }}}
" {{{ Indent Guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
" }}}
" {{{ Neomake
let g:neomake_go_enabled_makers=['gofmt']
let g:neomake_javascript_enabled_makers=['eslint']
" Use local ESLint by default
let g:neomake_javascript_eslint_exe='eslint-local'
let g:neomake_error_sign = { 'text': 'E>', 'texthl': 'SpellBad' }
let g:neomake_warning_sign = { 'text': 'W>',  'texthl': 'SpellCap' }
" }}}
" }}}

" {{{ NeoBundle
call neobundle#begin(expand('~/.nvim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" Defaults
NeoBundle 'tpope/vim-sensible'

" Libraries
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim', {'build':{'linux': 'make'}}
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'mattn/webapi-vim'

" Display
NeoBundle 'bling/vim-airline'
NeoBundle 'junegunn/goyo.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'ap/vim-css-color'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'rgarver/Kwbd.vim' " :Kwbd (close buffer, keep window)
NeoBundle 'roryokane/detectindent'

" Tools
NeoBundle 'tpope/vim-fugitive'
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
NeoBundleCheck
" }}}

" Colorscheme
color focuspoint

" {{{ Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='focuspoint'
let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c' ],
    \ [ 'x', 'y', 'warning' ]
    \ ]
let g:airline_section_x = g:airline#section#create_right(['%{g:airline_symbols.linenr} %l', '%c'])
let g:airline_section_y = g:airline#section#create(['filetype'])
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#tab_min_count = 2
" }}}

" {{{ Key mapping

" Embedded term window jumping
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Disable help key
map <S-k> <nop>

vmap <CR>   <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

nmap <Leader>T   <Plug>(easymotion-Tl)
nmap <Leader>t   <Plug>(easymotion-tl)
nmap <Leader>s   <Plug>(easymotion-sl)
nmap <Leader>F   <Plug>(easymotion-Fl)
nmap <Leader>f   <Plug>(easymotion-fl)
omap T   <Plug>(easymotion-Tl)
omap t   <Plug>(easymotion-tl)
omap s   <Plug>(easymotion-sl)
omap F   <Plug>(easymotion-Fl)
omap f   <Plug>(easymotion-fl)
omap W   <Plug>(easymotion-Wl)
omap w   <Plug>(easymotion-wl)
omap b   <Plug>(easymotion-bl)
omap B   <Plug>(easymotion-Bl)

nnoremap <silent> <Leader>n :VimFilerBufferDir -toggle -split -winwidth=0 -explorer<CR>
nmap <silent> <Leader>s :vsplit term<CR>

nmap <Leader><CR> :setl foldmethod=marker<CR>

nmap <silent> <Leader>cd :lcd %:h<CR>
nmap <silent> <Leader>md :Dispatch! mkdir -p %:p:h<CR>

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Shift-insert for mouse-less middle-click
map! <S-Insert> <MiddleMouse>

" NerdCommenter!
nmap <Leader>/ <plug>NERDCommenterToggle<CR>
vmap <Leader>/ <plug>NERDCommenterToggle<CR>

" Unite
nmap <Leader>; :UniteWithBufferDir -start-insert directory_rec/async -default-action=cd<CR>
nmap <Leader>' :UniteWithBufferDir -start-insert file_rec/async<CR>

" {{{ Deoplete key mapping
inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  deoplete#mappings#smart_close_popup()

" For smart TAB completion {{
inoremap <expr><TAB> deoplete#mappings#manual_complete()
" }}
" }}}
" }}}

" Remove cruft
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" {{{ Print mode
command! -nargs=* Hardcopy call DoMyPrint('<args>')
function! DoMyPrint(args)
  let colorsave=g:colors_name
  color print_bw
  setl printfont=courier\ 9
  setl printoptions=paper:letter,number:y,top:2pc,left:2pc,right:2pc,bottom:2pc
  exec 'hardcopy '.a:args
  exec 'color '.colorsave
endfunction
" }}}

" Auto-adjust quickfix, start at 3 lines, cap at 5
au FileType qf call AdjustWindowHeight(3, 5)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" Handle terminal resize
autocmd VimResized * :wincmd =

augroup DetectIndent
    autocmd!
    autocmd BufReadPost * DetectIndent
augroup END

" Syntax check on write
autocmd BufWritePost * Neomake

" Override xmlTag (JSX, really) as tag
hi def link xmlTag Tag
hi def link xmlTagName Macro
hi def link xmlEndTag Tag
