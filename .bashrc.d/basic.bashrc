# my .bashrc aliases file
# author: gauron99

alias ..='cd ..'
alias ...='cd ../..'
alias ll='ls -l'
alias la='ls -la'
alias bsh='vim ~/.bashrc'
alias bsha='vim ~/.bashrc.d'

#alias vim for gvim which has +clipboard enabled
alias v='gvim -v'
alias vi='gvim -v'
alias vim='gvim -v'

#git
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gl='git log --oneline'
alias fastgit='source fastgit'

#k8s
alias k='kubectl'
alias kns='kubens'

#podman&docker cleanup
alias engineclean='podman system prune && docker system prune'
