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

Plug 'vim-scripts/DoxygenToolkit.vim', {
	\ 'dir': '$pluginstalldir/language/c/DoxygenToolkit.vim',
	\ 'for' : ['c', 'cpp']
	\ }

Plug 'jackguo380/vim-lsp-cxx-highlight', {
	\ 'dir': '$pluginstalldir/language/c/vim-lsp-cxx-highlight',
	\ 'on' : [],
	\ 'description' : 'syntax highlight for c++11+ config in nochange'
	\ }
"}}}

" other language {{{
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

Plug 'elzr/vim-json', {
	\ 'dir' : '$pluginstalldir/language/json/vim-json',
	\ 'for': 'json'
	\ }

Plug 'matze/vim-tex-fold', {
	\ 'dir': '$pluginstalldir/language/tex/vim-tex-fold',
	\ 'for':  'tex'
	\ }

Plug 'rust-lang/rust.vim', {
			\ 'for' : ['rust', 'rs'],
			\ 'dir': '$pluginstalldir/language/rust/rust.vim'
			\ }
" }}}

" file{{{
Plug 'junegunn/fzf', { 'dir': '$pluginstalldir/.fzf', 'on' : []}
Plug 'junegunn/fzf.vim', {'dir' : '$pluginstalldir/tool/fzf.vim', 'on' : []}
" Plug 'mbbill/undotree', {'dir':'$pluginstalldir/tool/undotree', 'description' : 'no config no command'}
Plug 'simnalamburt/vim-mundo', {
		\ 'dir' : '$pluginstalldir/tool/vim-mundo'
	  	\ }
" }}}

" tool{{{
" Plug 'godlygeek/tabular', {'description': 'Vim 对齐'}
" Plug 'junegunn/vim-easy-align', {'description':'快速赋值语句对齐'}
" Plug 'jiangmiao/auto-pairs', {'dir':'$pluginstalldir/tool/auto-pairs', 'description' : 'no config no command 括号补全', 'on': []}
Plug 'APZelos/blamer.nvim', {
    \ 'dir' : '$pluginstalldir/tool/git/blamer.nvim',
	\ 'on' : ['BlamerToggle'],
	\ 'description' : 'show git blame :BlamerToggle'
	\ }
Plug 'Chiel92/vim-autoformat', {'on' : [], 'dir' : '$pluginstalldir/tool/vim-autoformat'}
" Plug 'andymass/vim-matchup', {
		" \ 'dir': '$pluginstalldir/tool/vim-matchup'
		  " \ }
Plug 'mhinz/vim-grepper', {
		\ 'on': ['Grepper', '<plug>(GrepperOperator)'],
		\ 'dir': '$pluginstalldir/tool/vim-grepper'
	  	\ }
Plug 'konfekt/fastfold', {'dir':'$pluginstalldir/tool/fastfold', 'on': []}
Plug 'gcmt/wildfire.vim', {
	\ 'dir' : '$pluginstalldir/tool/wildfire.vim',
	\ 'on' : []
	\ }
Plug 'skywind3000/vim-terminal-help', {'dir': '$pluginstalldir/tool/vim-terminal-help', 'on': []}
Plug 'skywind3000/vim-quickui', {'dir': '$pluginstalldir/colors/vim-quickui', 'on': []}
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
Plug 'scrooloose/nerdcommenter', {
			\ 'description':' 快速注释',
			\ 'dir': '$pluginstalldir/tool/nerdcomment',
			\ 'on': []
			\ }
Plug 'francoiscabrol/ranger.vim', {
		\ 'dir': '$pluginstalldir/tool/ranger.vim',
		\ 'on': []
	  	\ }
Plug 'TaDaa/vimade', {
		\ 'dir': '$pluginstalldir/tool/vimade',
		\ 'on': [],
		\ 'description': '聚焦窗口'
	  	\ }
Plug 'itchyny/vim-cursorword', {
		\ 'dir': '$pluginstalldir/tool/vim-cursorword',
		\ 'on': [],
		\ 'description': 'underline the work'
	  	\ }
Plug 'lfv89/vim-interestingwords', {
		\ 'dir': '$pluginstalldir/tool/vim-interestingwords',
		\ 'on': [],
		\ 'description': 'highlight different word'
	  	\ }
" }}}

" 外观{{{
" 配色方案{{{
Plug 'dracula/vim', {'dir': '$pluginstalldir/colors/dracula/vim', 'description' : 'no config no command for airline theme', 'on': []}
" Vim状态栏插件
Plug 'vim-airline/vim-airline',{'dir': '$pluginstalldir/colors/vim-airline', 'description': 'config in nochange', 'on' : []}
" Plug 'vim-airline/vim-airline-themes',{'dir': '$pluginstalldir/colors/vim-airline-themes'}
" }}}
Plug 'nathanaelkane/vim-indent-guides', {'description':'对齐代码的虚线 config in nochange', 'dir': '$pluginstalldir/colors/vim-indent-guides'}
Plug 'luochen1990/rainbow', {'dir' : '$pluginstalldir/colors/rainbow', 'description' :'\{\} config in nochange'}
Plug 'ryanoasis/vim-devicons',{'dir': '$pluginstalldir/colors/vim-devicons', 'description': '图标', 'on':[]}
"}}}

" other{{{
Plug 'skywind3000/vim-keysound', {'dir': '$pluginstalldir/tool/vim-keysound', 'description': 'key sound', 'on' : []}
Plug 'rlue/vim-barbaric', {'dir': '$pluginstalldir/tool/vim-barbaric', 'description' : '输入法'}
Plug 'christoomey/vim-tmux-navigator', {
		\ 'dir': '$pluginstalldir/tool/vim-tmux-navigator',
		\ 'on': [],
		\ 'description': 'c-h tmux 切换'
	  	\ }
" }}}

call plug#end()

function! LoadPlug(timer)
	" call plug#load('vim-diff-enhanced')
	" call plug#load('vim-signify')
	" call plug#load('vim-trailing-whitespace')
	call plug#load('vim')
	call plug#load('vim-airline')
	call plug#load('vim-devicons')
	call plug#load('ranger.vim')
	call plug#load('vimade')
	" call plug#load('accelerated-smooth-scroll')
endfunction

call timer_start(300, 'LoadPlug') "delay 500ms load

function! LoadPlugSe(timer)
	call plug#load('vim-quickui')
	call plug#load('wildfire.vim')
	call plug#load('vim-signature')
	" call plug#load('auto-pairs')
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
	call plug#load('vim-tmux-navigator')
	call plug#load('vim-interestingwords')
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

