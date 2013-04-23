HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
eval $(dircolors -b)

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

alias ls='ls --color=auto'

setopt notify histignoredups sharehistory histignorespace

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


# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select=1
zstyle :compinstall filename '/home/bernhard/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
