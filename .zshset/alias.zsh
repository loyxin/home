alias grep='grep --color=auto --exclude-dir={.git,.svn}'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '
alias wget='wget -c'
alias vi='vim'
alias ls='lsd'
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias cat='coat'
alias df='duf'

function _get_git_branch() {
    local _head_file _head
    local _dir="$PWD"

    while [[ -n "$_dir" ]]; do
        _head_file="$_dir/.git/HEAD"
        if [[ -f "$_dir/.git" ]]; then
            read -r _head_file < "$_dir/.git" && _head_file="$_dir/${_head_file#gitdir: }/HEAD"
        fi
        [[ -e "$_head_file" ]] && break
        _dir="${_dir%/*}"
    done

    if [[ -e "$_head_file" ]]; then
        read -r _head < "$_head_file" || return
        case "$_head" in
            ref:*) printf "${_head#ref: refs/heads/}" ;;
            "") ;;
            # HEAD detached
            *) printf "${_head:0:9}" ;;
        esac
        return 0
    fi

    return 1
}

alias gb="_get_git_branch && echo "
alias cdu='cd-gitroot'
