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
		call append(line(".")+1, "\# Author: " . g:myname)
		call append(line(".")+2, "\# mail: " . g:myemail)
		call append(line(".")+3, "\#########################################################################")
		call append(line(".")+4, "")
	endif
	if &filetype == 'cpp'
		call setline(1, "/*************************************************************************")
		call append(line("."), 	 "	> Author: " . g:myname)
		call append(line(".")+1, "	> Mail: " . g:myemail)
		call append(line(".")+2, " ************************************************************************/")
		call append(line(".")+3, "")
		" call append(line(".")+6, "#include<dbg.h>")
		call append(line(".")+4, "#include<iostream>")
		call append(line(".")+5, "")
	endif
	if &filetype == 'c'
		call setline(1, "/*************************************************************************")
		call append(line("."), "	> Author: " . g:myname)
		call append(line(".")+1, "	> Mail: " . g:myemail)
		call append(line(".")+2, " ************************************************************************/")
		call append(line(".")+3, "")
		call append(line(".")+4, "#include<stdio.h>")
		call append(line(".")+5, "")
	endif
	if &filetype == 'python'
	    call setline(1, "\#!/usr/bin/python")
		call setline(2, "\#coding=utf8")
	    call setline(3, "\"\"\"")
		call setline(4, "\# Author: " . g:myname)
		call setline(5, "\# Description:")
	    call setline(6, "")
	    call setline(7, "\"\"\"")
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
	"create a file???automatic position the end of file
	autocmd BufNewFile * normal G
endfunc
" }}}

" general functin {{{
"????????????????????????????????????????????????
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup resCur
	autocmd!
	autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END
" Clipboard
" ??????????????????
if has('clipboard')
	if has('unnamedplus')  " When possible use + register for copy-paste
		set clipboard=unnamed,unnamedplus
	else         " On mac and Windows, use * register for copy-paste
		set clipboard=unnamed
	endif
endif
" ??????????????????????????????????????????????????????????????????????????????????????? "I" ?????????????????????????????????????????????????????????????????????
if empty($TMUX)
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif
" ??????????????????????????????????????????????????????????????????????????????
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline
" ???????????????????????????
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" started In Diff-Mode set diffexpr (plugin not loaded yet)
if &diff
	let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
endif
" }}}

" my shortcut{{{

" my mouse toggle{{{
let s:lxtogglemouse = 0
function! Togglemouse()
	if s:lxtogglemouse
		set mouse=c
		let s:lxtogglemouse=0
		let g:cursorword=0
	else
		set mouse=a
		call plug#load('vim-cursorword')
		let g:cursorword=1
		let s:lxtogglemouse=1
	endif
endfunc
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
	:set nonumber
	:set laststatus=0
	:CocCommand git.toggleGutters
    let t:is_transparent = 1
  else
	:set relativenumber
	:set number
	:set laststatus=2
	:AirlineToggle
	:call plug#load('vim')
	colorscheme molokai
	:CocCommand git.toggleGutters
    let t:is_transparent = 0
  endif
endfunction
" }}}

" {{{
let g:cursorword = 1
function s:CursorToggle()
	if g:cursorword == 1
		let g:cursorword = 0
	else
		let g:cursorword = 1
	endif
endfunction
command CursorToggle call s:CursorToggle()
" }}}

" show shortcut {{{
" F7 cpp ???????????????
" ?????? F10 ??????/?????? Quickfix ??????
nnoremap <F2> :call HelpFNShortCutToggle()<CR>
nnoremap <F3> :Autoformat<CR>
set pastetoggle=<F4>
nnoremap <F5> :call Togglemouse()<CR>
nnoremap <F6> :call ToggleLine()<CR>
nnoremap <F7> :Vista!!<CR>
nnoremap <F8> :MundoToggle<CR>
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
nnoremap <F12> :call Toggle_transparent_background()<CR>

" help toggle {{{
nnoremap <M-h> :call HelpVimToggle()<CR>
function! HelpVimToggle()
	let s:content= [
		\ ['open shortcut', 'e ~/.vim/shortcut.md'],
		\ ['Fn shortcut', 'call HelpFNShortCutToggle()'],
		\ ['coc command', 'call HelpCocShortCutToggle()'],
		\ ['vim tips', 'call HelpVimTipsToggle()'],
		\ ['snip',  'e ~/.vim/doc/vim-snip'],
		\ ]
	let s:opts = {'title': 'open help'}
	call quickui#listbox#open(s:content, s:opts)
endfunction
function! HelpFNShortCutToggle()
	let s:content= [
		\ ['F2 vim help'],
		\ ['F3 Autoformat', 'Autoformat'],
		\ ['F4 Paste'],
		\ ['F5 mouse and cursor', 'call Togglemouse()'],
		\ ['F6 line', 'call ToggleLine()'],
		\ ['F7 mouse', 'Vista!!'],
		\ ['F8 undotree', 'MundoToggle'],
		\ ['F10 Quickfix', 'call asyncrun#quickfix_toggle(6)'],
		\ ['F12 transparency', 'call Toggle_transparent_background()'],
		\ ]
	let s:opts = {'title': 'F shortcut'}
	call quickui#listbox#open(s:content, s:opts)
endfunction
function! HelpCocShortCutToggle()
	let s:content= [
		\ ['Space o CocList outline'],
		\ ['Space s CocList symbols'],
		\ ['Space r ranger'],
		\ ['Ctrl ^ switch header'],
		\ [',rf refactor'],
		\ ['gs git chunkinfo'],
		\ [',gu git chunkundo'],
		\ [',kc ,kb ,ki conflict'],
		\ [',x v mode convert snip'],
		\ ]
	let s:opts = {'title': 'F Coc shortcut'}
	call quickui#listbox#open(s:content, s:opts)
endfunction
function! HelpVimTipsToggle()
	let s:content= [
		\ ['<c-x><c-f> ???????????????'],
		\ ['<c-x><c-i> ???????????????'],
		\ ['<c-x><c-e> ???????????????????????????'],
		\ ['<c-x><c-y> ???????????????????????????'],
		\ ['"aY ??????????????????a'],
		\ ['. ????????? $ ????????????'],
		\ ['<c-o> ????????????????????????????????????'],
		\ ['% ????????? {} () [] ?????????'],
		\ ['zz ????????????????????????????????????'],
		\ ['zt ????????????????????????????????????'],
		\ ['zb ????????????????????????????????????'],
		\ ['<c-o>????????????<c-i><c-o>??????'],
		\ ['alt+shift+hkjl windows']
		\ ]
	let s:opts = {'title': 'F vim tips'}
	call quickui#listbox#open(s:content, s:opts)
endfunction
" }}}
" }}}

" }}}
