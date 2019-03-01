# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
eval `dircolors -b`
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export EDITOR=vim
#alias pacman=pacman-color
complete -cf sudo # tab completion with sudo

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

PS1='\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    PROMPT_COMMAND='echo -ne "\n\033[1;34m$(date +%A,\ %d.\ %B\ %Y) - \033[0;32m$(date +%H:%M:%S)\n\033[35m${USER}@${HOSTNAME} \033[33m${PWD}\n\033[0;0m\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
    ;;
*)
    ;;
esac
