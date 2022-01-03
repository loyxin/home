if &compatible
  set nocompatible
endif
let $pluginstalldir = $myvimhome . '/.vim/bundle/repos'
let g:plug_threads=8
call plug#begin('$pluginstalldir')

" cpp {{{
" {{
Plug 'neoclide/coc.nvim', {
	\ 'dir' : '$pluginstalldir/coc.nvim',
	\ 'branch' : 'release',
	\ 'on' 	: []
	\ }
	" \ 'for' : ['c', 'cpp', 'rust', 'python', 'go', 'shell', 'txt'],

Plug 'liuchengxu/vista.vim', {
	\ 'dir' : '$pluginstalldir/tool/vista.vim',
	\ 'on'  : []
	\ }

" Plug 'vim-scripts/DoxyGen-Syntax', {
	" \ 'dir': '$pluginstalldir/Doxygen/Syntax',
	" \ 'for' : ['c', 'cpp']
	" \ }
Plug 'vim-scripts/DoxygenToolkit.vim', {
	\ 'dir': '$pluginstalldir/language/c/DoxygenToolkit.vim',
	\ 'for' : ['c', 'cpp']
	\ }
" Plug 'ton/vim-alternate', {
	" \ 'dir' : '$pluginstalldir/language/c/vim-alternate',
	" \ 'for' : ['c','cpp'],
	" \ 'description' : 'change .cpp to .h .cpp config in cpp'
	" \ }
" Plug 'octol/vim-cpp-enhanced-highlight', {
	" \ 'dir': '$pluginstalldir/language/c/vim-cpp-enhanced-highlight',
	" \ 'for': ['c','cpp'],
	" \ 'description' : 'syntax highlight for c++11+ config in nochange'
	" \ }

Plug 'jackguo380/vim-lsp-cxx-highlight', {
	\ 'dir': '$pluginstalldir/language/c/vim-lsp-cxx-highlight',
	\ 'on' : [],
	\ 'description' : 'syntax highlight for c++11+ config in nochange'
	\ }
"}}}

" other language {{{
" Plug 'hdima/python-syntax', {
			" \ 'description': 'python syntax highlight temp no use',
			" \ 'dir': '$pluginstalldir/language/python/syntax',
			" \ 'for':'py'
			" \ }
" Plug 'python-mode/python-mode', {
			" \ 'dir' : '$pluginstalldir/language/python/useful',
			" \ 'do' : '/usr/bin/git submodule update --init --recursive' ,
			" \ 'for' : 'py'
			" \}
Plug 'plasticboy/vim-markdown', {
	\ 'description':'markdown 语法高亮 no config',
	\ 'dir': '$pluginstalldir/language/mk/vim-markdown',
	\ 'for': 'markdown'
	\ }

Plug 'iamcco/markdown-preview.nvim', {
	\ 'description':'markdown generate in browser',
	\ 'dir': '$pluginstalldir/language/mk/markdown-preview.nvim',
	\ 'on': []
	\ }
Plug 'gcmt/wildfire.vim', {
	\ 'dir' : '$pluginstalldir/tool/wildfire.vim',
	\ 'on' : []
	\ }

Plug 'elzr/vim-json', {
	\ 'dir' : '$pluginstalldir/language/json/vim-json',
	\ 'for': 'json'
	\ }
Plug 'matze/vim-tex-fold', {
	\ 'dir': '$pluginstalldir/language/tex/vim-tex-fold',
	\ 'for':  'tex'
	\ }
"rust
Plug 'rust-lang/rust.vim', {
			\ 'for' : ['rust', 'rs'],
			\ 'dir': '$pluginstalldir/language/rust/rust.vim'
			\ }
" }}}

" Plug 'SirVer/ultisnips', {
			" \ 'description': '和snipmate.vim 一样，代码main<tab>',
			" \ 'dir' : '$pluginstalldir/snips/ultisnips',
			" \}
" Plug 'honza/vim-snippets', {'dir' : '$pluginstalldir/snips/vim-snippets'}

" Plug 'github/copilot.vim', {'on' : [], 'dir' : '$pluginstalldir/tool/copilot.vim'}

" format action {{{
" Plug 'godlygeek/tabular', {'description': 'Vim 对齐'}
Plug 'Chiel92/vim-autoformat', {'on' : [], 'dir' : '$pluginstalldir/tool/vim-autoformat'}
" Plug 'junegunn/vim-easy-align', {'description':'快速赋值语句对齐'}
Plug 'konfekt/fastfold', {'dir':'$pluginstalldir/tool/fastfold', 'on': []}
"}}}

" git{{{
Plug 'APZelos/blamer.nvim'
" Plug 'mhinz/vim-signify' , {'dir': '$pluginstalldir/language/git/vim-signify', 'description' : 'display the diff git'}
" Plug 'chrisbra/vim-diff-enhanced', {'dir' : '$pluginstalldir/language/git/vim-diff-enhance','on': [], 'description' : 'use in git merge'}
" }}}

" file{{{
Plug 'junegunn/fzf', { 'dir': '$pluginstalldir/.fzf', 'on' : []}
Plug 'junegunn/fzf.vim', {'dir' : '$pluginstalldir/tool/fzf.vim', 'on' : []}
Plug 'mbbill/undotree', {'dir':'$pluginstalldir/tool/undotree', 'description' : 'no config no command'}
" }}}

" tool{{{
Plug 'skywind3000/asyncrun.vim', {'dir' : '$pluginstalldir/async/asyncrun.vim', 'on' : []}
Plug 'skywind3000/asynctasks.vim', {'dir': '$pluginstalldir/async/asynctasks.vim', 'on': []}
Plug 'skywind3000/asyncrun.extra', {'dir': '$pluginstalldir/async/asyncrun.extra', 'on':[]}
" enhance clipboard
Plug 'tpope/vim-surround', {'dir': '$pluginstalldir/tool/vim-surround', 'on' : []}
" Plug 'vim-scripts/YankRing.vim', {'dir':'$pluginstalldir/tool/YankRing'}
Plug 'kshenoy/vim-signature' , {
	\ 'description': '代码收藏 键入 mm display use fzf search',
	\ 'dir':'$pluginstalldir/tool/vim-signature',
	\ 'on': []
	\ } " look doc
" Plug 'bronson/vim-trailing-whitespace', {
	" \ 'description': 'FixWhitespace whitespace in red',
	" \ 'dir':'$pluginstalldir/tool/vim-trailing-whitespace',
	" \ 'on' : []
	" \ }
Plug 'jiangmiao/auto-pairs', {'dir':'$pluginstalldir/tool/auto-pairs', 'description' : 'no config no command 括号补全', 'on': []}
" Plug 'Shougo/defx.nvim', {'dir':'$pluginstalldir/tool/nerd/trees'} " temp not need now
Plug 'scrooloose/nerdcommenter', {
			\ 'description':' 快速注释',
			\ 'dir': '$pluginstalldir/tool/nerdcomment',
			\ 'on': []
			\ }
" }}}

" 外观{{{
" 配色方案{{{
" Plug 'altercation/vim-colors-solarized', {'dir': '$pluginstalldir/colors/vim-colors-solarized'}
" Plug 'tomasr/molokai', {'dir': '$pluginstalldir/colors/molokai'}
" Plug 'vim-scripts/phd', {'dir': '$pluginstalldir/colors/phd'}
Plug 'dracula/vim', {'dir': '$pluginstalldir/colors/dracula/vim', 'description' : 'no config no command for airline theme'}
" Vim状态栏插件
Plug 'vim-airline/vim-airline',{'dir': '$pluginstalldir/colors/vim-airline', 'description': 'config in nochange', 'on' : []}
" Plug 'vim-airline/vim-airline-themes',{'dir': '$pluginstalldir/colors/vim-airline-themes'}
" }}}
" Plug 'ludovicchabant/vim-gutentags', {'dir' : '$pluginstalldir/colors/tagbar/tags', 'filetype': 'c'}
Plug 'nathanaelkane/vim-indent-guides', {'description':'对齐代码的虚线 config in nochange', 'dir': '$pluginstalldir/colors/vim-indent-guides'}
" Plug 'yonchu/accelerated-smooth-scroll', {'dir': '$pluginstalldir/colors/smooth-scroll', 'on' : []}
Plug 'luochen1990/rainbow', {'dir' : '$pluginstalldir/colors/rainbow', 'description' :'\{\} config in nochange'}
"}}}

" other{{{
Plug 'skywind3000/vim-keysound', {'dir': '$pluginstalldir/tool/vim-keysound', 'description': 'key sound', 'on' : []}
Plug 'skywind3000/vim-terminal-help', {'dir': '$pluginstalldir/tool/vim-terminal-help', 'on': []}
Plug 'skywind3000/vim-quickui', {'dir': '$pluginstalldir/colors/vim-quickui', 'on': []}
" }}}

call plug#end()

function! LoadPlug(timer)
	" call plug#load('vim-diff-enhanced')
	" call plug#load('vim-signify')
	" call plug#load('vim-trailing-whitespace')
	call plug#load('vim-airline')
	" call plug#load('accelerated-smooth-scroll')
endfunction

call timer_start(300, 'LoadPlug') "delay 500ms load

function! LoadPlugSe(timer)
	call plug#load('vim-quickui')
	call plug#load('wildfire.vim')
	call plug#load('vim-signature')
	call plug#load('auto-pairs')
	call plug#load('nerdcommenter')
	call plug#load('vim-terminal-help')
	call plug#load('vim-autoformat')
	call plug#load('fastfold')
	call plug#load('vim-surround')
	call plug#load('fzf')
	call plug#load('fzf.vim')
	call plug#load('asyncrun.vim')
	call plug#load('asyncrun.extra')
	call plug#load('asynctasks.vim')
	" call plug#load('vim-keysound')
" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
	autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
	" call plug#load('copilot.vim')
endfunction
call timer_start(1000, 'LoadPlugSe') "delay 1000ms load
" 插件列表结束
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"}}}

