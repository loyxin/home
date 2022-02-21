# Vim

## 按键映射

|   递归   |   非递归     | 模式                             |
| -------- | ------------ | -------------------------------- |
| `:map`   | `:noremap`   | normal, visual, operator-pending |
| `:nmap`  | `:nnoremap`  | normal                           |
| `:xmap`  | `:xnoremap`  | visual                           |
| `:cmap`  | `:cnoremap`  | command-line                     |
| `:omap`  | `:onoremap`  | operator-pending                 |
| `:imap`  | `:inoremap`  | insert                           |

使用 `:nunmap <space>` 可以取消这个映射。

：`:nmap` 是**递归执行**的！结果是，右边执行可能的映射。

```vim
:nmap b :echo "Foo"<cr>
:nmap a b
```

如果你敲击<kbd>a</kbd>，我们期望着光标回退到上一个单词，但是实际情况是“Foo”被输出到命令行里！因为在右边，`b` 已经被映射到别的行为上了，换句话说就是 `:echo "Foo"<cr>`。

经验法则：除递归映射是必须的，否则总是使用非递归映射。

如果你想禁止用标准映射，把他们映射到特殊字符 `<nop>` 上，例如：`:noremap <left> <nop>`。

## 寄存器

寄存器就是存储文本的地方。我们常用的「复制」操作就是把文本存储到寄存器，「 粘贴」 操作就是把文本从寄存器中读出来。顺便，在 Vim 中复制的快捷键是 <kbd>y</kbd>，粘贴的快捷键是 <kbd>p</kbd>。


| 标识               | 包含的字符来源                                         |
| ------------------ | ------------------------------------------------------ |
| `"`                | 最近一次的复制或删除操作 (`d`, `c`, `s`, `x`, `y`)     |
| `0`至`9`           | 寄存器 `0`: 最近一次复制。寄存器 `1`: 最近一次删除。   |
| `-`                | 最近一次行内删除                                       |
| `a`至`z`, `A`至`Z` | 复制操作存储文本至寄存器 `a`							  |
| `:`与`.`和`%`      | `:`: 最近命令 `.`: 最近文本，`%`: 当前的文件名         |
| `+`和`*`           | `*` 和 `+` 是 [剪贴板](#剪贴板) 寄存器                 |
| `_`                | 黑洞寄存器。对于当前操作，不在寄存器中保留文本		  |
| `/`                | 最近一次通过 `/`、`?` 或 `:global` 等命令调用的匹配条件|

**将文本存到指定的寄存器中**：
命令 `"aY` 可以将当前行复制，并存储到寄存器 `a` 中。这时移动光标至其他位置，通过命令 `"AY` 就可以把这一行的内容扩展到寄存器 `a` 中，而之前存储的内容也不会丢失。

## 范围

范围 (Ranges) 其实很好理解，但很多 Vim 用户的理解不到位。

- 很多命令都可以加一个数字，用于指明操作范围
- 范围可以是一个行号，用于指定某一行
- 范围也可以是一对通过 `,` 或 `;` 分割的行号
- 大部分命令，默认只作用于当前行
- 只有 `:write` 和 `:global` 是默认作用于所有行的

范围的使用是十分直观的。以下为一些例子（其中，`:d` 为 `:delete` 的缩写）：

| 命令                | 操作的行                                                          |
| ------------------- | ----------------------------------------------------------------- |
| `:d`                | 当前行                                                            |
| `:.d`               | 当前行                                                            |
| `:1d`               | 第一行                                                            |
| `:$d`               | 最后一行                                                          |
| `:1,$d`             | 所有行                                                            |
| `:%d`               | 所有行（这是 `1,$` 的语法糖）                                     |
| `:.,5d`             | 当前行至第 5 行                                                   |
| `:,5d`              | 同样是当前行至第 5 行                                             |
| `:,+3d`             | 当前行及接下来的 3 行                                             |
| `:1,+3d`            | 第一行至当前行再加 3 行                                           |
| `:,-3d`             | 当前行及向上的 3 行（Vim 会弹出提示信息，因为这是一个保留的范围） |
| `:3,'xdelete`       | 第三行至[标注](#标注) 为 x 的那一行                               |
| `:/^foo/,$delete`   | 当前行以下，以字符 "foo" 开头的那一行至结尾                       |
| `:/^foo/+1,$delete` | 当前行以下，以字符 "foo" 开头的那一行的下一行至结尾               |

需要注意的是，`;` 也可以用于表示范围。区别在于，`a,b` 的 `b` 是以当前行作为参考的。而 `a;b` 的 `b` 是以 `a` 行作为参考的。举个例子，现在你的光标在第 5 行。这时 `:1,+1d` 会删除第 1 行至第 6 行，而 `:1;+1d` 会删除第 1 行和第 2 行。

如果你想设置多个寻找条件，只需要在条件前加上 `/`，比如：

```vim
:/foo//bar//quux/d
```

这就会删除当前行之后的某一行。定位方式是，先在当前行之后寻找第一个包含 "foo" 字符的那一行，然后在找到的这一行之后寻找第一个包含 "bar" 字符的那一行，然后再在找到的这一行之后寻找第一个包含 "quux" 的那一行。删除的就是最后找到的这一行。

## 补全

针对不同的补全方案，Vim 为我们提供了不同的按键映射。这些映射都是在**插入模式中**通过 <kbd>Ctrl</kbd> + <kbd>x</kbd> 来触发：

| 映射         | 类型                                            | 帮助文档   |
| ------------ | ----------------------------------------------- | ---------- |
| `<c-x><c-l>` | 整行                                            | `:h i^x^l` |
| `<c-x><c-n>` | 当前缓冲区中的关键字                            | `:h i^x^n` |
| `<c-x><c-k>` | 字典（请参阅 `:h 'dictionary'`）中的关键字      | `:h i^x^k` |
| `<c-x><c-t>` | 同义词字典（请参阅 `:h 'thesaurus'`）中的关键字 | `:h i^x^t` |
| `<c-x><c-i>` | 当前文件以及包含的文件中的关键字                | `:h i^x^i` |
| `<c-x><c-]>` | 标签                                            | `:h i^x^]` |
| `<c-x><c-f>` | 文件名                                          | `:h i^x^f` |
| `<c-x><c-d>` | 定义或宏定义                                    | `:h i^x^d` |
| `<c-x><c-v>` | Vim 命令                                        | `:h i^x^v` |
| `<c-x><c-u>` | 用户自定义补全（通过 `'completefunc'` 定义）    | `:h i^x^u` |
| `<c-x><c-o>` | Omni Completion（通过 `'omnifunc'` 定义）       | `:h i^x^o` |
| `<c-x>s`     | 拼写建议                                        | `:h i^Xs`  |

## airline

| A | B |                     C                          X | Y | Z |  [...] |

section  meaning (example)~
--------------------------
  A      displays mode + additional flags like crypt/spell/paste (`INSERT`)
  B      VCS information (branch, hunk summary) (`master`)
  C      filename + read-only flag (`~/.vim/vimrc RO`)
  X      filetype  (`vim`)
  Y      file encoding[fileformat] (`utf-8[unix]`)
         optionally may contain Byte Order Mark `[BOM]` and missing end of last
         line `[!EOL]`
  Z      current position in the file
           percentage % ln: current line/number of lines ☰ cn: column
           So this: 10% ln:10/100☰ cn:20
	   means: >
              10%     - 10 percent
	      ln:     - line number is
              10/100☰ - 10 of 100 total lines
	      cn:     - column number is
              20      - 20
<
  [...]  additional sections (warning/errors/statistics)
         from external plugins (e.g. YCM/syntastic/...)
