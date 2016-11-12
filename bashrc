# .bashrc
# These configs are executed for non-login shells.

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# bash environments
PS1='\[\e[32m\][\u@\H]\[\e[m\] \[\e[4;33m\]\w\[\e[m\]\n\[\e[7;31m\]\$>>\[\e[0m\] '
PS2='\[\e[7;31m\]>\[\e[0m\] '
set -o vi
shopt -s extglob
umask 0027
export TERM='xterm-256color'

# User specific aliases and functions
#export LANG="C.UTF-8"
export lxHome="${HOME}/lxHome"
export PATH="${PATH}:${HOME}/local/usr/bin:${HOME}/local/bin:${HOME}/.local/bin"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${HOME}/local/usr/lib64:${HOME}/local/usr/lib"

# more alias
alias ls='ls --color=auto'
alias la='ls -A'
alias ll='ls -l'
alias lt='ls -Alrt'
alias vi='vim'
alias vim='vim -p'

# key mapping
# ref: http://www.ibb.net/~anne/keyboard/keyboard.html#Bash
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# ssh tunnel
alias tunnelCERN='ssh -D 11080 pchen@lxplus.cern.ch'

# Apply site specification
source  ${HOME}/init.sh
 
# others

