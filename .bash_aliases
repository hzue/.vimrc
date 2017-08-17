alias cls='clear'
alias cp='cp -i'
alias du='du -h --max-depth=1'
alias h='history | grep'
alias mv='mv -i'
alias vi='vim'
alias ee='exit'
alias ptt='ssh bbsu@ptt.cc'

# Tmux
alias tx='tmux -2 attach'
alias tr='tmux rename-session -t'
alias tt='tmux -2 attach -t'
alias tl='tmux ls'
alias td='tmux detach'

# cd
cd() { builtin cd "$@"; ls; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias ....='cd ../../../'                     # Go back 3 directory levels

# ls
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
function _ls() {
    LANG=zh_TW.BIG5
    /bin/ls -C --color=always $@ #| /usr/bin/iconv -f big5 -t utf8
    LANG=zh_TW.UTF-8
}

# rm
alias rm='_rm'
alias rrm='/bin/rm -i'
function _rm() {
while [ $# -ge 1 ]; do
	mv -f "$1" $HOME/tmp
	echo "$1 deleted."
	shift
done
}
