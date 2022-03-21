# If you come from bash you might have to change your $PATH.
source ~/.profile
[[ -d ~/.zplug ]] || git clone https://github.com/zplug/zplug ~/.zplug
source ~/.zplug/init.zsh

zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "lib/completion", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/git", from:oh-my-zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh

zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/wd", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/universalarchive", from:oh-my-zsh
zplug "plugins/rust", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh
zplug "plugins/fancy-ctrl-z", from:oh-my-zsh
zplug "plugins/catimg", from:oh-my-zsh
zplug "plugins/copypath", from:oh-my-zsh
zplug "plugins/timer", from:oh-my-zsh
zplug "plugins/ripgrep", from:oh-my-zsh
zplug "plugins/fd", from:oh-my-zsh
zplug "plugins/aliases", from:oh-my-zsh
zplug "plugins/safe-paste", from:oh-my-zsh

zplug 'dracula/zsh', as:theme
DRACULA_DISPLAY_GIT=0

zplug "mollifier/cd-gitroot", as:plugin, lazy:true
zplug "hlissner/zsh-autopair", defer:2
zplug "jgogstad/passwordless-history"
zplug "zdharma-continuum/fast-syntax-highlighting", defer:3
zplug "zsh-users/zsh-autosuggestions"
zplug "arzzen/calc.plugin.zsh"
zplug "djui/alias-tips"
zplug "wfxr/forgit"
zplug "k4rthik/git-cal", as:command
zplug "escalate/oh-my-zsh-proxy-plugin"
zplug "sobolevn/wakatime-zsh-plugin"

zplug load

source ~/.zshset/alias.zsh
source ~/.fzf.zsh

export GIT_SSL_NO_VERIFY=1

source ~/.zshset/.zshlx

# eval "$(mcfly init zsh)"
export EDITOR='vim'
export SSH_KEY_PATH="~/.ssh/id_rsa"

PATH=~/bin:~/.local/bin:~/program/install/bin:~/.cargo/bin:/usr/local/bin:$PATH
export PATH
export LANG="en_US.UTF-8"
export GIT_SSL_NO_VERIFY=1
export FZF_DEFAULT_COMMAND='fd --type f --color=never -E "node_modules"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --color=never"
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {} 2> /dev/null'"
export BAT_THEME=Dracula
