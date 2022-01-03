" The-NERD-Tree{{{
" open a NERDTree automatically when vim starts up if no files were specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" let g:NERDTreeDirArrows = 1
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'
" open a NERDTree automatically when vim starts ultisnips
" autocmd vimenter * NERDTree
" }}}

"YankRing{{{
"将yankring的历史文件夹移到~/.vim
let g:yankring_history_dir = $HOME.'/.vim/bundle'
"修改历史文件名
let g:yankring_history_file = '.yankring_history'
"<leader>m选择上一个复制的文本
let g:yankring_replace_n_pkey = '<leader>m'
"<leader>n选择下一个复制的文本
let g:yankring_replace_n_nkey = '<leader>n'
"<leader>y显示yankring中的内容
" nmap <Leader>ys  :YRShow<CR>
"fix for yankring and neovim
let g:yankring_clipboard_monitor=0
"}}}

" gutentags{{{
let g:gutentags_enabled=0
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand($myvimhome . '/.vim/bundle/repos/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
" }}}
" file expore netrw{{{
" d mkdir
" x excute if dir into if other openwith
" i change display
" s sort
" }}}

" file expore defx {{{
" call defx#custom#option('_', {
      " \ 'winwidth': 30,
      " \ 'split': 'vertical',
      " \ 'direction': 'botright',
      " \ 'show_ignored_files': 0,
      " \ 'buffer_name': '',
      " \ 'toggle': 1,
      " \ 'resume': 1
      " \ })
" }}}
" let g:AlternatePaths = ['../itf', '../src', './', '../', '../include', '../inc', './src', './inc', './include']
" let g:AlternateExtensionMappings = [{'.cpp' : '.h', '.h' : '.cpp', '.hh' : '.cc', '.cc' : '.hh'}, {'.c': '.h', '.h': '.c'}]
" vim-cpp-enhanced-highlight{{{
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_member_variable_highlight = 1
" }}}
" vim-powerline{{{
"set fillchars+=stl:\ ,stlnc:\
" }}}
" vim-latex{{{
set iskeyword+=:
let g:Tex_Flavor='xelatex'
let g:tex_flavor='xelatex'
" modify .vim/bundle/vim-latex/ftplugin/
let g:suppress_latex_suite=1
" au BufRead,BufNewFile *.tex unlet g:suppress_latex_suite
let g:Tex_CompileRule_pdf = 'xelatex  $*'
let g:Tex_FormatDependency_pdf = 'pdf'
let g:Tex_DefaultTargetFormat = 'pdf'
" }}}
" vim-latex-live-preview{{{
" LLPStartPreview
let g:livepreview_previewer = 'okular'
let g:livepreview_engine = 'xelatex'
" }}}
function! Latexmake()
	call setline(1, "all: ")
	call setline(2, "\t xelatex \$<")
endfunction
