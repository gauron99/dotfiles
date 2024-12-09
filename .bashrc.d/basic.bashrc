# my .bashrc aliases file
# author: gauron99

alias ..='cd ..'
alias ll='ls -l'
alias la='ls -la'
alias bsh='vim ~/.bashrc'
alias bsha='vim ~/.bashrc.d'

#alias vim for gvim which has +clipboard enabled
alias v='gvim -v'
alias vim='gvim -v'

#git
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gl='git log --oneline'
alias fastgit='git add -u && git commit -sm "$1" || git commit -sm "fix" && git push'

#k8s
alias k='kubectl'
alias kns='kubens'
