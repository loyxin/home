" GENERAL SETTINGS{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible  " 设置不兼容原始 vi 模式（必须设置在最开头）
set t_Co=256 "vim开启256色支持
set guifont=SimSun   " 设置字体
" :set sw=4           设置缩进宽度为 4
" :set ts=4           设置制表符宽度为 4
" :set noet           设置不展开 tab 成空格
" :set et             设置展开 tab 成空格
"编码设置
set encoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
"配色方案
" colorscheme solarized
" colorscheme phd
colorscheme molokai
" colorscheme phd
" colorscheme dracula
set background=dark
" 开启文件类型检测
filetype on
"允许插件
filetype plugin on
filetype plugin indent off
syntax on      "语法高亮
" set	  foldenable      " 允许折叠
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
" set   foldmethod=syntax
" set   autoindent " 自动缩进
" set   cindent
" 设置当文件被改动时自动载入
set   autoread
set   autowrite "自动保存
set   backspace=indent,eol,start "backspace不能使用
set   hlsearch " 高亮显示搜索结果
set   ignorecase "搜索忽略大小写
set   smartcase " 有一个以上的大写字母仍大小写敏感
set   incsearch " 输入查找内容时进行匹配
"显示行号
set   number
set   relativenumber
set   ruler  "显示标尺 显示当前行号列号
set   scrolloff=5 " 移动buffer顶部底部保持5行距离
set   shiftwidth=4 "自动缩进宽度为 4
set   tabstop=4 "tab 制表符所占宽度为 4
" set   smartindent "智能缩进
set   showcmd  "输入的命令显示出来，看的清楚些
set   showmode "显示当前模式``
set   showmatch "括号匹配"
"set   whichwrap=h,l " hl 换行
set   wildignore=*.bak,*.o,*.e,*~,*.class,.svn,*.pyc,*.swp
set   wildmode=list:longest,full
" vim 自身命令行模式智能补全
set wildmenu
"超过70分行 自动换行显示
set   wrap
" set	  tw=70
set   cursorline " 高亮行
hi CursorLine term=bold cterm=bold ctermbg=66 ctermfg=NONE
set completeopt-=preview
set completeopt=longest,menu
set gcr=a:blinkon1

set complete-=i   " disable scanning included files
set complete-=t   " disable searching tags
"set completeopt=longest,menu
set undofile
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 不可以用鼠标移动光标 a是可以
set   mouse=c
set history=1000      " Store a ton of history (default is 20)
" 设置系统复制
" set clipboard=unnamedplus
" set clipboard=exclude:.*
"}}}

" other setting{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 临时文件管理设置
" 如果文件夹不存在，则新建文件夹
if !isdirectory($myvimhome . '/.vim/bundle/files') && exists('mkdir')
  call mkdir($myvimhome . '/.vim/bundle/files')
endif
" 备份文件
set backup
set backupdir   =$myvimhome/.vim/bundle/files/backup/
set backupext   =-vimbackup
set backupskip  =
" 交换文件
set directory   =$myvimhome/.vim/bundle/files/swap/
set updatecount =100
" 撤销文件
set undofile
set undodir     =$myvimhome/.vim/bundle/files/undo/
" viminfo 文件
" if has('nvim')
" set viminfo 	='100,n~/.vim/bundle/files/info/nvim/viminfo
" else
" set viminfo     ='100,n~/.vim/bundle/files/info/viminfo
" endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"}}}
