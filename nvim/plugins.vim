" vim: foldmethod=marker foldlevel=0
" Plugin Settings
"

" Javascript/JSON
let g:vim_json_syntax_conceal = 0
let g:jsx_ext_required = 0
let g:vim_json_syntax_conceal = 0
let g:tern_request_timeout = 1
" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

let g:splitjoin_trailing_comma = 1

let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0
let g:gitgutter_signs = 0

" Go! {{{
let g:go_auto_type_info = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_fmt_fail_silently = 0
" }}}

" {{{ Deoplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use deoplete.
let g:deoplete#enable_at_startup = 1
" Use smartcase.
let g:deoplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:deoplete#enable_fuzzy_completion = 0

" Shell style
let g:deoplete#auto_completion_start_length = 1
let g:deoplete#disable_auto_complete = 1
let g:deoplete#lock_buffer_name_pattern = '\*ku\*'

let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources.go = ['buffer', 'member', 'tag', 'file', 'neosnippet']
let g:deoplete#sources#go#sort_class = ['func', 'type', 'var', 'const']
let g:deoplete#sources#go#align_class = 1
" Define dictionary.
let g:deoplete#sources#dictionary#dictionaries = {
    \ 'default' : ''
\ }

" Define keyword.
if !exists('g:deoplete#keyword_patterns')
    let g:deoplete#keyword_patterns = {}
endif
let g:deoplete#keyword_patterns['default'] = '\h\w*'

call deoplete#custom#set('_', 'matchers', ['matcher_head'])
call deoplete#custom#set('_', 'sorter', ['matcher_head'])
call deoplete#custom#set('_', 'converters', ['converter_remove_paren', 'converter_remove_verlap'])
call deoplete#custom#set('_', 'disabled_syntaxes', ['Comment', 'String'])
call deoplete#custom#set('go', 'rank', 9999)
call deoplete#custom#set('jedi', 'rank', 9999)
call deoplete#custom#set('omni', 'rank', 9999)
call deoplete#custom#set('ultisnips', 'rank', 5000)
call deoplete#custom#set('ultisnips', 'min_pattern_length', 0)
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

let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 0
" }}}

" Damn it Ultisnips!
let g:UltiSnipsExpandTrigger="<Plug>(UltiSnipsExpand)"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
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
let g:neomake_javascript_enabled_makers=['eslint']
" Use local ESLint by default
let g:neomake_javascript_eslint_exe='eslint-local'
let g:neomake_error_sign = { 'text': 'E>', 'texthl': 'SpellBad' }
let g:neomake_warning_sign = { 'text': 'W>',  'texthl': 'SpellCap' }
" }}}

" {{{ Airline
let g:airline_theme = 'focuspoint'
let g:airline#extensions#default#layout = [
  \ [ 'a', 'x', 'c' ],
  \ [ 'y', 'b', 'warning' ]
  \ ]
let g:airline#extensions#default#section_truncate_width = {
      \ 'y': 80,
      \ 'b': 80,
      \}
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#tab_min_count = 2

let g:airline_powerline_fonts = 1
let g:airline_section_x = g:airline#section#create_left(['%{g:airline_symbols.linenr} %l:%c'])
let g:airline_section_y = g:airline#section#create(['filetype'])
" }}}
