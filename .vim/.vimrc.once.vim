" vim-indent-guides{{{
let g:indent_guides_enable_on_vim_startup = 1
" second indent display
let g:indent_guides_start_level = 2
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
" hi IndentGuidesOdd  guibg=red   ctermbg=3
" hi IndentGuidesEven guibg=green ctermbg=4
" }}}

" rainbow_parentheses {{{
" 不加入这行, 防止黑色括号出现, 很难识别
" \ ['black',       'SeaGreen3'],
let g:rbpt_colorpairs = [
			\ ['brown',       'RoyalBlue3'],
			\ ['darkgray',    'DarkOrchid3'],
			\ ['Darkblue',    'SeaGreen3'],
			\ ['darkcyan',    'RoyalBlue3'],
			\ ['darkred',     'SeaGreen3'],
			\ ['darkgreen',   'firebrick3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['brown',       'firebrick3'],
			\ ['gray',        'RoyalBlue3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['Darkblue',    'firebrick3'],
			\ ['darkred',     'DarkOrchid3'],
			\ ['darkcyan',    'SeaGreen3'],
			\ ['darkgreen',   'RoyalBlue3'],
			\ ['red',         'firebrick3'],
			\ ]
" let g:rbpt_max = 16
" let g:rbpt_loadcmd_toggle = 0
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces
let g:rainbow_active = 1
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}
" }}}

" vim-airline{{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#coc#enabled = 1
" let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
" let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline_theme='sierra'
let g:airline_theme='dracula'
let g:airline_powerline_fonts = 1
" }}}

" keysound{{{
" 启动 Vim 时自动启动
let g:keysound_enable = 1
" 设置默认音效主题，可以选择：default, typewriter, mario, bubble, sword
let g:keysound_theme = 'default'
" 设置 python 版本：2 或者3 默认会自动检测
let g:keysound_py_version = 3
" 设置音量：0-1000
let g:keysound_volume = 500
" }}}

" vim-autoformat{{{
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces=0
let g:formatterpath = ['$myvimhome/.vim/.clang-format']
" python
"let g:formatter_yapf_style = 'pep8'
" autocmd FileType c,cpp autocmd BufWritePre <buffer> silent :Autoformat
" }}}


" one line setting{{{
let g:NERDSpaceDelims=1 " 注释符号后面空一格
" }}}
