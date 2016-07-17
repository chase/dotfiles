" vim: foldmethod=marker foldlevel=0
" Note: Skip initialization for vim-tiny or vim-small
if !1 | finish | endif

let mapleader = ","
set nowrap

set shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab textwidth=0
set autoindent
set smarttab
"set smartindent

set backspace=indent,eol,start

set nrformats-=octal
set ttimeout
set ttimeoutlen=100

set completeopt-=preview

set diffopt+=vertical
set foldmethod=indent foldnestmax=2 foldlevelstart=1 nofoldenable

set mouse=nvc

set ignorecase
set smartcase
set incsearch
set wrapscan

set laststatus=2
set showcmd

set scrolloff=5
set sidescrolloff=5
set display+=lastline

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

set autoread
set fileformats+=mac

if &history < 1000
  set history=1000
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

if filereadable(expand("~/.config/nvim/bundles.vim"))
  source ~/.config/nvim/bundles.vim
endif

if filereadable(expand("~/.config/nvim/plugins.vim"))
  source ~/.config/nvim/plugins.vim
endif

" Colorscheme
color focuspoint

" {{{ Key mapping
inoremap <C-U> <C-G>u<C-U>

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

nmap <silent> <Leader>s :vsplit +term<CR>

nmap <Leader><CR> :setl foldmethod=marker<CR>

nmap <silent> <Leader>cd :lcd %:h<CR>

nmap <silent> <Leader>md :Dispatch! mkdir -p %:p:h<CR>

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR> :let @/=""<CR>

" Shift-insert for mouse-less middle-click
map! <S-Insert> <MiddleMouse>

" NerdCommenter!
nmap <Leader>/ <plug>NERDCommenterToggle<CR>
vmap <Leader>/ <plug>NERDCommenterToggle<CR>

" Unite
nmap <Leader>; :UniteWithBufferDir -start-insert directory_rec/async -default-action=cd<CR>
nmap <Leader>' :UniteWithBufferDir -start-insert file_rec/async<CR>

" {{{ Deoplete
inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  deoplete#mappings#smart_close_popup()

inoremap <silent><expr><S-Tab> pumvisible() ? "\<C-p>" : "\<C-d>"
inoremap <silent><Tab> <C-r>=<SID>my_tab_function()<CR>
function! s:my_tab_function() abort
  if pumvisible()
    return "\<C-n>"
  endif

  let line = getline('.')
  let cnum = col('.')
  let point = cnum >= 2 ? line[:cnum - 2] : ''
  if point =~ '^$' || point =~ '\s$'
    return "\<Tab>"
  endif

  return deoplete#mappings#manual_complete()
endfunction

inoremap <silent><CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  if pumvisible()
    let result = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
      return result
    endif

    return deoplete#mappings#close_popup() . "\<CR>"
  endif

  let line = getline('.')
  let cnum = col('.')
  let point = cnum >= 2 ? line[:cnum - 2] : ''
  if point =~ '^\s\+$'
    return "\<C-u>\<CR>"
  endif

  return "\<CR>"
endfunction
" TODO: Consider making an smap for <CR> to exit snippet?
" }}}

" }}}

" Remove cruft
autocmd FileType * setl formatoptions-=cro | setl formatoptions+=mMBlj

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
augroup Neomake
  autocmd!
  let blacklist = ['cpp']
  autocmd BufWritePost * if index(blacklist, &ft) < 0 | Neomake
augroup END

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Override xmlTag (JSX, really) as tag
hi def link xmlTag Tag
hi def link xmlTagName Macro
hi def link xmlEndTag Tag
