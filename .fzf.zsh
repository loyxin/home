# Setup fzf
# ---------
if [[ ! "$PATH" == *~/.vim/bundle/repos/.fzf/bin* ]]; then
  export PATH=${PATH:+${PATH}:}~/.vim/bundle/repos/.fzf/bin
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source ~/.vim/bundle/repos/.fzf/shell/completion.zsh 2> /dev/null

# Key bindings
# ------------
source ~/.vim/bundle/repos/.fzf/shell/key-bindings.zsh
