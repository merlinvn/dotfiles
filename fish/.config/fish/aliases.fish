# aliases
alias l "ls -p -G"
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l -A"
# alias lla "ll -A"

alias cat "bat --paging=never -p"
alias bat "bat --paging=never"

if type -q eza
    alias ll "eza -l -g -a --icons always"
    # alias lla "ll -a"
end

alias g git
alias gs "git status"
alias ga "git add"
alias gc "git commit"
alias gp "git pull"
alias gpsh "git push"
alias gl "git log"
alias gd "git diff"
alias gdc "git diff --cached"
alias gco "git checkout"
alias lg lazygit

alias n nvim

alias python python3

alias open "open -a Bloom"

alias mini 'NVIM_APPNAME=nvim-mini nvim'
