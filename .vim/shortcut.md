# vim shortcut

space e 文件管理器
文件管理器 ? -> help

### fastfold
check command with markdown
za                  切换折叠
zA                  递归切换折叠
zf                  创建代码折叠
zF                  指定行数创建折叠
zd                  删除光标下折叠
zD                  递归删除所有折叠
zj 移动至下一个折叠 zk 移动至上一个折叠
zm                  所有代码折叠一层
zM                  所有代码折叠
zr                  所有代码打开一层
zR                  所有代码打开
zE                  删除所有折叠

### markdown
[[ "跳转上一个标题
]] "跳转下一个标题
]c "跳转到当前标题
]u "跳转到副标题
`:TableFormat`: Format the table under the cursor
:HeaderDecrease
:Toc 显示 vertical 标题 enter 进入对应的
:Toch horiz
:InsertToc 无顺序数字显示
:InsertNToc 有数字显示


### surround

删除包围符号的命令是ds,后面加的字符表示要删除的符号，比如：
"Hello world!"           ds"         Hello world!
替换包围符号的命令是cs,命令后跟两个参数，分别是被替换的符号和需要使用的符号。比如
"Hello world!"           cs"'        'Hello world!'
添加包围符号的命令是ys(ys可以记为you surround)，命令后同样跟两个参数，第一个是一个vim“动作”（motion）或者是一个文本对象,其中motion即vim动作，比如说w向后一个单词。文本对象简单的来说主要是来通过一些分隔符来标识一段文本，比如iw就是一个文本对象，即光标下的单词。
Hello world!             ysiw)       Hello (world)!

remember cs 替换 ds 删除
cs"'

### Quickfix 窗口

:copen              打开 quickfix 窗口（查看编译，grep等信息）
:copen 10           打开 quickfix 窗口，并且设置高度为 10
:cclose             关闭 quickfix 窗口
:cfirst             跳到 quickfix 中第一个错误信息
:clast              跳到 quickfix 中最后一条错误信息
:cc [nr]            查看错误 [nr]
:cnext              跳到 quickfix 中下一个错误信息
:cprev              跳到 quickfix 中上一个错误信息

### Dox.vim
:Dox 函数/类注释 将光标放在 function 或者 class 的名字所在的一行
:DoxBlock 插入注释块
:DoxLic 生成 License 的地方
:DoxAuthor Author 将光标放在合适的地方
:DoxUndoc(DEBUG)

### fzf
install ag rg perl
:Files [PATH] 找文件 path 下
:GFiles [opt] = git ls-files 找 git 文件
:GFiles? git status 下改动的文件
:Buffers buffer 下找文件
:Snippets
:Maps Normal mode mappings
:Colors 更改颜色主题
:Rg

:Command 展示有那些命令
insert C+x c+f 补全路径
leader+ tab 显示命令

### nerdcommand
,c<空格> 被选区域部分被注释 则被选区域执取消注释操作 其它情况执行反转注释操作
,cs，以”性感”的方式注释
,ci 反转注释操作，选中区域注释部分取消注释，非注释部分添加注释
,c$ 注释当前光标到改行结尾的内容
,cA 跳转到该行结尾添加注释，并进入编辑模式
,ca 转换注释的方式，比如： /**/和//
,cl ,cb 左对齐和左右对其，左右对其主要针对/**/
,cu 取消注释

### async Plugin  https://github.com/skywind3000/asyncrun.vim

:AsyncRun ls        异步运行命令 ls 结果输出到 quickfix 使用 :copen 查看
:AsyncRun -raw ls   异步运行命令 ls 结果不匹配 errorformat

#### asyncrun

**异步运行 gcc 编译当前的文件**

	:AsyncRun gcc % -o %<
	:AsyncRun g++ -O3 "%" -o "%<" -lpthread 

:cnext
:cprev
jump the error place

#### asynctask
:AsyncTaskEdit
#### asynctask
:AsyncTaskEdit
edit .task file

```ini
# 定义一个新任务
[file-build]
# 定义任务需要执行的命令，以 `$(...)` 形式出现的宏会在执行时被具体替换
command=gcc -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)"
# 定义命令运行的目录
cwd=$(VIM_FILEDIR)

[file-run]
command="$(VIM_FILEDIR)/$(VIM_FILENOEXT)"
cwd=$(VIM_FILEDIR)
# 定义输出方式，在终端内运行
output=terminal
```

这里定义了两个任务：`file-build` 和 `file-run` 在包含这个 `.tasks` 配置文件的目录及其子目录下面任意一个文件，都可以用：

```VimL
:AsyncTask file-build
:AsyncTask file-run
```

### signature
mark
mx mark x
'x meaning: go to the position of x mark
dmx delete mark x
m,: Place the next available mark
m.: If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
m-: Delete all marks from the current line
m<Space>     Delete all marks from the current buffer
m/           Open location list and display marks from current buffer
m<BS>        Remove all markers
m?           Open location list and display markers from current buffer

]` jump next mark
[` previous
use fzf :Marks to search

m[0-9]:Toggle the corresponding marker !@#$%^&*()
m<S-[0-9]>:Remove all markers of the same type

]-: Jump to next line having a marker of the same type
[-: Jump to prev line having a marker of the same type
]=: Jump to next line having a marker of any type
[=: Jump to prev line having a marker of any type

### other tips
C+v visual
s+v
v
C+x number descrease
C+a number inscrease

c+v + I every block do same operator insert mode
c+v + g every block do same operator normal mode
https://yianwillis.github.io/vimcdoc/doc/visual.html

{
在所有被选择的行后加上点东西：
<Ctrl-v> 选中行
$ 到行最后（不加将在每行行首编辑）
A 块操作中进入插入模式
输入 ESC
}

插入模式下ctrl + o可以让你执行一次正常模式下的命令
"ayy 就是复制当前行到 "a 字母寄存器中

:%s/<search>/<replace>/ g global :line1,line2s/^/#/g
:%s/foo/bar/gc ask to manually confirm (`c` flag) each replacement
'a,'bs/from/to/g 对标记a和b之间的行（含a和b所在的行）进行替换，其中a和b是之前用m命令所做的标记
:., +10s/p1/p2/g    将当前行到相对当前行加10行的区间中所有p1替换为p2

/fred\|joe          搜索 fred 或者 joe
/\<\d\d\d\d\>       精确搜索四个数字
/^\n\{3}            搜索连续三个空行

CTRL-W              向后删除单词
2gUw 可以将当前单词以及下一个单词转成大写
:%!xxd              开始二进制编辑
:%!xxd -r           保存二进制编辑
`:diffsplit` 缩写 `:diffs` diff 模式打开一个分屏，后面可以加上 {filename}
`split` 创建分屏 缩写 `:sp` `vsplit` 缩写 `:vs` 创建垂直分屏

[[和]]用来在函数之间跳转，其中[[为跳转到上一个函数开头，]]为跳转到下一个函数开头。
][为跳转到本函数的结尾。

### cpp
gd 意思： go to definition
先按 [ 再按 ctrl+d 跳转到#define处
先按 [ 再按 ctrl+i 跳转到函数、变量和#define
gd                  跳转到局部定义（光标下的单词的定义）
gD                  跳转到全局定义（光标下的单词的定义）
gf                  打开名称为光标下文件名的文件
[[                  跳转到上一个顶层函数（比如C语言以大括号分隔）
]]                  跳转到下一个顶层函数（比如C语言以大括号分隔）
[m                  跳转到上一个成员函数
]m                  跳转到下一个成员函数
[{                  跳转到上一处未匹配的 {
]}                  跳转到下一处未匹配的 }
[(                  跳转到上一处未匹配的 (
])                  跳转到下一处未匹配的 )
[c                  上一个不同处（diff时）
]c                  下一个不同处（diff时）
[/                  跳转到 C注释开头
]/                  跳转到 C注释结尾
```
``                  回到上次跳转的位置
''                  回到上次跳转的位置
`.                  回到上次编辑的位置
'.                  回到上次编辑的位置
```

### vim-terminal-help

- `ALT` + `=`: toggle terminal below.
- `ALT` + `SHIFT` + `h`: move to the window on the left.
- `ALT` + `SHIFT` + `l`: move to the window on the right.
- `ALT` + `SHIFT` + `j`: move to the window below.
- `ALT` + `SHIFT` + `k`: move to the window above.
- `ALT` + `SHIFT` + `n`: move to the previous window.
- `ALT` + `-`: paste register 0 to terminal.
- `ALT` + `q`: switch to terminal normal mode.

### rust
:RustFmt
:RustTest

### bufexplorer插件
,be打开历史文件列表
,bs水平新建历史文件列表窗口，
,bv垂直新建历史文件列表
'<Leader>bt' (toggle open / close)  or

