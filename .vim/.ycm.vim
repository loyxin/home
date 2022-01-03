"rust setup
autocmd BufReadPost *.rs setlocal filetype=rust
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'nightly', 'rls'], 
	\}

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" Plugin setting{{{
" YouCompleteMe {{{
"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-t>']
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_path_to_python_interpreter = 'python3'
let g:ycm_auto_trigger=1 "加这句话启动自动补全而不是按键补全
let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
let g:ycm_use_ultisnips_completer = 1 "提示UltiSnips
let g:ycm_collect_identifiers_from_comments_and_strings = 1   "注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_tags_files = 1  " 开启 YCM 基于标签引擎
let g:ycm_confirm_extra_conf=0      " 关闭加载.ycm_extra_conf.py提示
" 开启语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
" 回车作为选中
let g:ycm_key_list_stop_completion = ['<CR>']
let g:ycm_seed_identifiers_with_syntax=1   "语言关键字补全, 不过python关键字都很短，所以，需要的自己打开
" 跳转到定义处, 分屏打开
let g:ycm_goto_buffer_command = 'horizontal-split'
let g:ycm_register_as_syntastic_checker = 0
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
" au FileType c  let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycmd/completers/c/'
let g:ycm_global_ycm_extra_conf = $myvimhome . '/.vim/.ycm_extra_conf.py'
" 直接触发自动补全 insert模式下
let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_min_num_identifier_candidate_chars = 2
" set completeopt=menu,menuone
" let g:ycm_add_preview_to_completeopt = 0
" 黑名单,不启用
let g:ycm_filetype_blacklist = {
			\ 'tagbar' : 1,
			\ 'gitcommit' : 1,
			\}


let g:ycm_semantic_triggers =  {
			\   'c' : ['->', '.'],
			\   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
			\             're!\[.*\]\s'],
			\   'ocaml' : ['.', '#'],
			\   'cpp,objcpp' : ['->', '.', '::'],
			\   'perl' : ['->'],
			\   'php' : ['->', '::'],
			\   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
			\   'ruby' : ['.', '::'],
			\  'tex'  : ['\ref{','\cite{'],
			\   'lua' : ['.', ':'],
			\   'erlang' : [':'],
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
" ycm 补全触发文件类型
" let g:ycm_filetype_whitelist = {
" \ "c":1,
" \ "cpp":1,
" \ "objc":1,
" \ "sh":1,
" \ "python":1,
" \ "zsh":1,
" \ "tex":1,
" \ }

let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }

highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black

" }}}
