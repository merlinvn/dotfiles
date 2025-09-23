set -gx PATH /opt/homebrew/bin $PATH
set -x OpenMP_ROOT (brew --prefix)/opt/libomp
set -x VCPKG_ROOT ~/vcpkg

# setup autojump
set -l file (brew --prefix)/opt/autojump/share/autojump/autojump.fish
test -s "$file"; and source $file

# alias j="cd (cat ~/Library/autojump/autojump.txt | sort -nr | awk -F '\t' '{print \$NF}' | fzf +s)"
# Define the 'j' function with fallback to autojump when arguments are provided
function j
    if test (count $argv) -gt 0
        # Use the default autojump 'j' command if arguments are passed
        autojump $argv
        # After jumping, switch to that directory if found by autojump
        and cd (autojump $argv)
    else
        # Use fzf selection if no arguments are passed
        set dir (cat ~/Library/autojump/autojump.txt | sort -nr | awk -F '\t' '{print $NF}' | fzf +s --exit-0)
        if test -n "$dir"
            cd $dir
        end
    end
end

# Fzf
set -g FZF_PREVIEW_FILE_CMD "bat --style=numbers --color=always --line-range :500"
set -g FZF_LEGACY_KEYBINDINGS 0

/opt/homebrew/bin/mise activate fish | source

set -gx PATH (brew --prefix llvm)/bin $PATH
