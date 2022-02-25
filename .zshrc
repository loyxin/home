# If you come from bash you might have to change your $PATH.
source ~/.profile
export LANG="en_US.UTF-8"

# ZSH的环境变量
export ZSH=~/.oh-my-zsh
# 主题设置
# 主题列表在 ~/.oh-my-zsh/themes/ 如果设置为 "random", 每次开启都会是不同的主题
#See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="dracula"
# ZSH_THEME="powerlevel9k/powerlevel9k"
# 如果想要大小写敏感，可以取消注释下面的一行
# CASE_SENSITIVE="true"

# 如果想要连接符不敏感，可以取消注释下面的一行。_ 和 - 将可以互换
# HYPHEN_INSENSITIVE="true"

# 如果不想要自动更新，可以取消注释下面的一行
DISABLE_AUTO_UPDATE="true"

# 自动更新的时间间隔，单位是天，这里设置 30 天更新一次
export UPDATE_ZSH_DAYS=30

# 如果不想要 ls 命令输出带颜色，可以取消注释下面的一行
# DISABLE_LS_COLORS="true"

# 是否禁止更改终端标题,不要禁止,不然所有终端tab只显示zsh了,而不随着目录的改变而改变显示
# DISABLE_AUTO_TITLE="true"

# 自动纠正命令,不启用,不怎么好用
# ENABLE_CORRECTION="true"

# 按tab键补全命令的时候,如果没什么可补全的就会出现三个红点,更人性化显示，这里我们启用
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# 历史命令日期显示格式
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(colored-man-pages wd extract rust vi-mode fancy-ctrl-z catimg colorize copydir gitfast universalarchive timer zsh-autosuggestions)
# zsh-syntax-highlighting correct command green incorrect red
# vi-mode esc to insert add vi function
# fancy-ctrl-z hit Ctrl-z once again to get back to Vim
# colorize color cat color less
# Copies the path of your current folder to the system clipboard
# universalarchive 压缩文件 ua <format> <files>
# source ~/.zplugin/bin/zplugin.zsh
# source ~/.zshplugin

username=`whoami`
if [ "$username" = "root" ];then
   	export ZSH=/root/.oh-my-zsh
fi
set ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#--------------------------------------------------------------

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# git alias
source ~/.zshset/.zshgit
source ~/.zshset/.zshalias

PATH=~/bin:/usr/local/bin:~/.local/bin:~/program/install/bin:~/.cargo/bin:$PATH
export PATH
source ~/.fzf.zsh

export GIT_SSL_NO_VERIFY=1

source ~/.zshset/.zshlx

source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# eval "$(mcfly init zsh)"
export FZF_DEFAULT_COMMAND='fd --type f --color=never -E "node_modules"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --color=never"
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {} 2> /dev/null'"
