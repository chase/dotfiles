" vim: foldmethod=marker
" Note: Skip initialization for vim-tiny or vim-small
if !1 | finish | endif

if has('vim_starting')
    if &compatible
        set nocompatible
    endif

    set runtimepath+=~/.vim/bundle/neobundle.vim/
    set runtimepath+=~/.vim/hilinks/
    set runtimepath+=~/.vim/print-bw/
endif

let mapleader = ","
set number
set autochdir
set encoding=utf-8
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab textwidth=0

" {{{ Plugin Settings
" Go! {{{
let g:go_auto_type_info = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
" }}}
" {{{ Neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#enable_fuzzy_completion = 0

" Shell style
let g:neocomplete#disable_auto_complete = 1
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist'
\ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Clang support
let g:marching_clang_command = "/usr/bin/clang"
let g:marching_enable_neocomplete = 1

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.cpp =
            \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

let g:neocomplete#force_omni_input_patterns.python = ''
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" }}}
" Ultisnips (Plays nicely with neocomplete) {{{
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" }}}
" {{{ iPython
let g:ipy_perform_mappings = 0
let g:ipy_completefunc = 'local'
" }}}
" {{{ Tagbar
let g:tagbar_type_javascript = { 'ctagsbin' : '/usr/bin/jsctags' }
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
let g:vimfiler_tree_closed_icon = "►"
let g:vimfiler_readonly_file_icon = ""
let g:vimfiler_marked_file_icon = "◉"
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_enable_auto_cd = 1
" }}}
" {{{ Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='focuspoint'
" }}}
" {{{ Indent Guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
" }}}
" {{{ Syntastic
let g:syntastic_mode_map = { 'mode': 'active',
  \ 'active_filetypes': [],
  \ 'passive_filetypes': ['cpp','c','h'] }
" }}}
" }}}

" {{{ NeoBundle
call neobundle#begin(expand('~/.vim/bundle/'))
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
NeoBundle 'rgarver/Kwbd.vim' " :Bclose (close buffer, keep window)
NeoBundle 'roryokane/detectindent'

" Tools
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'chrisbra/NrrwRgn'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-eunuch' " :SudoEdit/SudoWrite

" Error checks
NeoBundle 'scrooloose/syntastic'

" Motion
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-surround'
NeoBundle 'edsono/vim-matchit'
NeoBundle 'michaeljsmith/vim-indent-object'
NeoBundle 'thinca/vim-visualstar'

" Code assist
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'osyo-manga/vim-marching'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-endwise'

" Search
NeoBundle 'rking/ag.vim'

" Folding
NeoBundle 'chase/vim-foldfocus'
NeoBundle 'kshenoy/vim-origami'

" {{{ Languages
NeoBundle 'tpope/vim-git'
NeoBundle 'fatih/vim-go'
NeoBundle 'leafo/moonscript-vim'
NeoBundle 'ivanov/vim-ipython'

NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mmalecki/vim-node.js'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'elzr/vim-json'

NeoBundle 'chase/Vim-Jinja2-Syntax'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'tpope/vim-haml'

NeoBundle 'groenewege/vim-less'
NeoBundle 'cakebaker/scss-syntax.vim'

NeoBundle 'ajf/puppet-vim'
NeoBundle 'chase/vim-ansible-yaml'

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

" {{{ Key mapping
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

nmap <silent> <Leader>, :VimFilerExplorer<CR>
nnoremap <silent> <Leader>n :VimFilerExplorer<CR>
nmap <silent> <Leader>s :shell<CR>

nmap <CR> :call FoldFocus('vnew')<CR>
nmap <Leader><CR> :setl foldmethod=marker<CR>

nmap <silent> <Leader>cd :lcd %:h<CR>
nmap <silent> <Leader>md :Dispatch! mkdir -p %:p:h<CR>

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Shift-insert for mouse-less middle-click
map! <S-Insert> <MiddleMouse>

" {{{ Neocomplete key mapping
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() . "\<Space>" : "\<Space>"
" <CR>: Close popup, complete, return and save indent
function! s:my_cr()
    return neocomplete#close_popup() . "\<CR>"
endfunction
inoremap <silent><CR> <C-r>=<SID>my_cr()<CR>

" For smart TAB completion {{
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ neocomplete#start_manual_complete()
function! s:check_back_space()
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction
" }}
" }}}
" }}}

" {{{ iPython Setup
function! UpIPython()
python << EOF
if not kc:
    km_from_string()
EOF
    map  <buffer> <silent> <Leader>d <Plug>(IPython-OpenPyDoc)
    map  <buffer> <silent> <C-Return> <Plug>(IPython-RunFile)
    map  <buffer> <silent> <Leader>rf <Plug>(IPython-RunFile)
    map  <buffer> <silent> <Leader>rl  <Plug>(IPython-RunLine)
    imap <buffer> <silent> <C-s>  <C-o><Plug>(IPython-RunLine)
    xmap <buffer> <silent> <C-s>  <Plug>(IPython-RunLines)
endfunction

augroup ipython
    autocmd!
    autocmd FileType python
                \ call system('pgrep -c ipython2') |
                \ if v:shell_error |
                \   call dispatch#start_command(1, 'ipython2 kernel') |
                \ endif |
                \ call UpIPython()
augroup END
" }}}

" {{{ Better split action for Vimfiler
let s:opentopleft = { 'is_selectable' : 1 }
function! s:opentopleft.func(candidates)
  for candidate in a:candidates
    call unite#util#command_with_restore_cursor('topleft split')
    call unite#take_action('open', candidate)
  endfor
endfunction
call unite#custom#action('openable', 'topleft', s:opentopleft)
autocmd FileType vimfiler nnoremap <silent><buffer><expr> S vimfiler#do_action('topleft')
"}}}

" Remove cruft
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" {{{ Print mode
command! -nargs=* Hardcopy call DoMyPrint('<args>')
function DoMyPrint(args)
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
