if type -q eza
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
end

# setup autojump
set -l file (brew --prefix)/opt/autojump/share/autojump/autojump.fish
test -s "$file"; and source $file
alias j="cd (cat ~/Library/autojump/autojump.txt | sort -nr | awk -F '\t' '{print \$NF}' | fzf +s)"


# Fzf
set -g FZF_PREVIEW_FILE_CMD "bat --style=numbers --color=always --line-range :500"
set -g FZF_LEGACY_KEYBINDINGS 0
