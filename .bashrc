# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

alias xis='sudo xbps-install -S'
alias xqr='xbps-query -R'
alias xqrs='xbps-query -Rs'

alias gco='git checkout'
alias gcob='git checkout -b'
alias gs='git status'
alias ga='git add'
alias gd='git diff'
clear

neofetch

# eval "$(zellij setup --generate-auto-start bash)"
