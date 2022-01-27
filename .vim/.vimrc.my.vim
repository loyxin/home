autocmd FileType python set tabstop=4 shiftwidth=4 expandtab autoindent
autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2 expandtab autoindent

autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
autocmd BufRead,BufNewFile *.tex set filetype=tex
" autocmd BufRead,BufNewFile *.{py}

" NEW FILE: {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"create a .c,.h,.sh,.java file,automatic insert a title
autocmd BufNewFile *.py,*.cpp,*.[ch],*.sh,*.{md,mdown,mkd,mkdn,markdown,mdwn},*.tex exec ":call MySetTitle()"
autocmd FileType python set omnifunc=pythoncomplete#Complete
"define a funtion[MySetTitle]automatic a title
function! MySetTitle()
	".sh file
	if &filetype == 'sh'
		call setline(1,"\#!/bin/bash")
		call append(line("."), "\#########################################################################")
		call append(line(".")+1, "\# File Name: ".expand("%"))
		call append(line(".")+2, "\# Author: " . g:myname)
		call append(line(".")+3, "\# mail: " . g:myemail)
		call append(line(".")+4, "\# Created Time: ".strftime("20%y-%m-%d %H:%M:%S"))
		call append(line(".")+5, "\#########################################################################")
		call append(line(".")+6, "")
	endif
	if &filetype == 'cpp'
		call setline(1, "/*************************************************************************")
		call append(line("."), "	> File Name: ".expand("%"))
		call append(line(".")+1, "	> Author: " . g:myname)
		call append(line(".")+2, "	> Mail: " . g:myemail)
		call append(line(".")+3, "	> Created Time: ".strftime("20%y-%m-%d %H:%M:%S"))
		call append(line(".")+4, " ************************************************************************/")
		call append(line(".")+5, "")
		" call append(line(".")+6, "#include<dbg.h>")
		call append(line(".")+7, "#include<iostream>")
		call append(line(".")+8, "using namespace std;")
		call append(line(".")+9, "")
	endif
	if &filetype == 'c'
		call setline(1, "/*************************************************************************")
		call append(line("."), "	> File Name: ".expand("%"))
		call append(line(".")+1, "	> Author: " . g:myname)
		call append(line(".")+2, "	> Mail: " . g:myemail)
		call append(line(".")+3, "	> Created Time: ".strftime("20%y-%m-%d %H:%M:%S"))
		call append(line(".")+4, " ************************************************************************/")
		call append(line(".")+5, "")
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
	if &filetype == 'python'
	    call setline(1, "\#!/usr/bin/python")
		call setline(2, "\#coding=utf8")
	    call setline(3, "\"\"\"")
		call setline(4, "\# Author: " . g:myname)
		call setline(5, "\# Created Time : ".strftime("20%y-%m-%d %H:%M:%S"))
		call setline(6, "")
		call setline(7, "\# File Name: ".expand("%"))
		call setline(8, "\# Description:")
	    call setline(9, "")
	    call setline(10, "\"\"\"")
	endif
	if &filetype == 'markdown'
	    call setline(1, "\---")
        call setline(2, "layout: post")
        call setline(3, "title:")
        call setline(4, "subtitle:")
        call setline(5, "date: ".strftime("20%y-%m-%d %H:%M:%S"))
        call setline(6, "category:")
        call setline(7, "author: " . g:myname)
        call setline(8, "tags:")
        call setline(9, "   -")
        call setline(10, "\---")
	endif
	if &filetype == 'tex'
		call setline(1,"\\documentclass[12pt,a4paper]{article}")
		call setline(2,"%")
		call setline(3,"\\begin{document}")
		call setline(4,"\\title{}")
		call setline(5,"\\maketitle")
		call setline(6,"%")
		call setline(7,"\\end{document}")
	endif
	"create a file，automatic position the end of file
	autocmd BufNewFile * normal G
endfunc
" }}}

" general functin {{{
"记录上次打开某一文件时的光标位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup resCur
	autocmd!
	autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END
" Clipboard
if has('clipboard')
	if has('unnamedplus')  " When possible use + register for copy-paste
		set clipboard=unnamed,unnamedplus
	else         " On mac and Windows, use * register for copy-paste
		set clipboard=unnamed
	endif
endif
" 普通模式下用块状光标，在插入模式下用条状光标（形状类似英文 "I" 的样子），然后在替换模式中使用下划线形状的光标
if empty($TMUX)
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif
" 这个效果出现在当前窗口，而且在插入模式中关闭这个效果
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" started In Diff-Mode set diffexpr (plugin not loaded yet)
if &diff
	let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
endif
" }}}

" my shortcut{{{

" fold toggle {{{
let s:lxtogglemark = 1
function! Togglefoldmark()
	if s:lxtogglemark
		set foldmethod=marker
		let s:lxtogglemark=0
	else
		set foldmethod=syntax
		let s:lxtogglemark=1
	endif
endfunc
nnoremap <F3> :call Togglefoldmark()<CR>
" }}}

" my mouse toggle{{{
let s:lxtogglemouse = 0
function! Togglemouse()
	if s:lxtogglemouse
		set mouse=c
		let s:lxtogglemouse=0
	else
		set mouse=a
		let s:lxtogglemouse=1
	endif
endfunc
nnoremap <F5> :call Togglemouse()<CR>
" }}}

" line releative line{{{
let s:lxtoggleline = 1
function! ToggleLine()
	if s:lxtoggleline
		set norelativenumber
		let s:lxtoggleline=0
	else
		set relativenumber
		let s:lxtoggleline=1
	endif
endfunc
nnoremap <F6> :call ToggleLine()<CR>
" }}}

" help toggle {{{
nnoremap <c-h> :call HelpVimToggle()<CR>
function! HelpVimToggle()
    let g:lxTipstoggle="on"
	let content= [
		\ ['none'],
		\ ['open shortcut', 'e ~/.vim/shortcut.md'],
		\ ['git', 'e ~/.vim/doc/git.txt'],
		\ ['siguature', 'e ~/.vim/doc/siguature.txt'],
		\ ['surrounding', 'e ~/.vim/doc/vi-surrounding'],
		\ ['snip',  'e ~/.vim/doc/vim-snip'],
		\ ]
	let opts = {'title': 'open help'}
	call quickui#listbox#open(content, opts)
endfunction
function! Helpmy(num)
    pedit ~/vimtips.txt
	if(a:num=="h")
		e ~/.vim/doc/vi-help.md
	elseif(a:num=="snip")
		e ~/.vim/doc/snipMate.txt
	endif
endfunction
" }}}

" Highlight EOL whitespace, http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight default ExtraWhitespace ctermbg=darkred guibg=darkred
autocmd ColorScheme * highlight default ExtraWhitespace ctermbg=darkred guibg=darkred
autocmd BufRead,BufNew * if 1 | match ExtraWhitespace /\\\@<![\u3000[:space:]]\+$/ | else | match ExtraWhitespace /^^/ | endif

" {{{
let t:is_transparent = 0
function! Toggle_transparent_background()
  if t:is_transparent == 0
    hi Normal guibg=NONE ctermbg=NONE
	:AirlineToggle
	:set norelativenumber
	:set laststatus=0
	:CocCommand git.toggleGutters
    let t:is_transparent = 1
  else
	:set relativenumber
	:set laststatus=2
	:AirlineToggle
	:call plug#load('vim')
	colorscheme molokai
	:CocCommand git.toggleGutters
    let t:is_transparent = 0
  endif
endfunction
nnoremap <F1> :call Toggle_transparent_background()<CR>
" }}}

" }}}
