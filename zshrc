# In gnome-terminal we must use the following workaround in order to make a shell in a new tab start in the current working directory.
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=706065
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=712208
# http://unix.stackexchange.com/questions/93476/gnome-terminal-keep-track-of-directory-in-new-tab
# https://bugs.launchpad.net/ubuntu-gnome/+bug/1193993
[[ -s "/etc/profile.d/vte.sh" ]] && . "/etc/profile.d/vte.sh"

export EDITOR=vim
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
eval $(dircolors -b)

# When using SSH for the first time in this session, start SSH agent and add private key to its cache
alias ssh='eval $(keychain --eval --agents ssh -Q --quiet --nogui id_ecdsa) && ssh'
alias scp='eval $(keychain --eval --agents ssh -Q --quiet --nogui id_ecdsa) && scp'

bindkey -v
KEYTIMEOUT=1 # for switching to vi command mode immediately
bindkey -M vicmd '^R' redo
bindkey -M vicmd 'u' undo
bindkey -M viins '^r' history-incremental-search-backward

# shift-tab
bindkey "$terminfo[kcbt]" reverse-menu-complete

# delete
bindkey "$terminfo[kdch1]" delete-char
bindkey -M vicmd "$terminfo[kdch1]" vi-delete-char

# insert
bindkey "$terminfo[kich1]" overwrite-mode
bindkey -M vicmd "$terminfo[kich1]" vi-insert

# home
bindkey "$terminfo[khome]" vi-beginning-of-line
bindkey -M vicmd "$terminfo[khome]" vi-beginning-of-line

# end
bindkey "$terminfo[kend]" vi-end-of-line
bindkey -M vicmd "$terminfo[kend]" vi-end-of-line

# page up
bindkey "$terminfo[kpp]" history-beginning-search-backward
bindkey -M vicmd "$terminfo[kpp]" history-beginning-search-backward

# page down
bindkey "$terminfo[knp]" history-beginning-search-forward
bindkey -M vicmd "$terminfo[knp]" history-beginning-search-forward

# CTRL + left/right arrow
bindkey '^[[1;5D' vi-backward-word
bindkey -M vicmd '^[[1;5D' vi-backward-word
bindkey '^[[1;5C' vi-forward-word
bindkey -M vicmd '^[[1;5C' vi-forward-word

# Make CTRL + W delete up to the last slash
backward-delete-to-slash () {
	local WORDCHARS=${WORDCHARS//\//}
	zle .backward-delete-word
}
zle -N backward-delete-to-slash
bindkey "^W" backward-delete-to-slash

alias ls='ls --color=auto'
alias grep='grep --color=auto'

setopt notify histignoredups sharehistory histignorespace nobeep autocd

setopt prompt_subst
vim_ins_mode='
%B%F{blue}%n@%m%f %F{white}%d%f
%B%F{red}❯%F{yellow}❯%F{green}❯%f%b '
vim_cmd_mode='
%B%F{blue}%n@%m%f %F{white}%d%f
%B%F{green}❮%F{yellow}❮%F{red}❮%f%b '
vim_mode=$vim_ins_mode
function zle-keymap-select {
	vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
	zle reset-prompt
}
zle -N zle-keymap-select
function zle-line-finish {
	vim_mode=$vim_ins_mode
}
zle -N zle-line-finish
PROMPT='${vim_mode}'

# Fill in first result from the completion menu already after pressing Tab for the first time
setopt menucomplete

# Make cd behave like pushd. (Use popd to go back recursively.)
# http://unix.stackexchange.com/questions/84445/is-there-a-way-to-cd-back-multiple-times-in-bash?newsletter=1&nlcode=180097|b898
setopt auto_pushd

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select=1
zstyle ':completion:*:commands' rehash 1 # Don't use cache for completing (useful when, e.g., installing new applications)
# Ignore some files for vim argument completion
ignored_files=('*?.aux' '*?.bbl' '*?.blg' '*?.log' '*?.nav' '*?.pdf' '*?.snm' '*?.spl' '*?.synctex.gz' '*?.tex.latexmain' '*?.toc' '*?.o' '*?.out' '*?.vrb')
zstyle ':completion:*:*:vim:*:*files' ignored-patterns ${ignored_files}
zstyle ':completion:*:*:gvim:*:*files' ignored-patterns ${ignored_files}
zstyle :compinstall filename '/home/bernhard/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
