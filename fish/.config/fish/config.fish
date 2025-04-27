set fish_greeting ""

set -gx TERM xterm-256color

# theme
# set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# PATH
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

fish_add_path $HOME/.fzf/bin

# Rust 
fish_add_path $HOME/.cargo/bin

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -x GOBIN $HOME/.local/bin
fish_add_path $GOBIN
fish_add_path /usr/local/go/bin

# Neovim
fish_add_path $HOME/.local/share/bob/nvim-bin

# Maestro
#fish_add_path $HOME/.maestro/bin

type -q nvim; and set -gx EDITOR nvim

# starship
type -q starship; and starship init fish | source

type -q zoxide; and zoxide init fish | source

function fish_prompt
    printf "\033]7;file://%s%s\a" (hostname) (pwd)
    starship prompt
end

# color scheme
source ~/.config/fish/tokyonight_night.fish

# OS specific configuration
switch (uname)
    case Darwin
        source ~/.config/fish/config-osx.fish
    case Linux
        source ~/.config/fish/config-linux.fish
    case '*'
        source ~/.config/fish/config-windows.fish
end

set LOCAL_CONFIG ~/.config/fish/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

# Added by Windsurf
fish_add_path /Users/neo/.codeium/windsurf/bin

# aliases should be loaded last to avoid path resolution issues
if test -f ~/.config/fish/aliases.fish
    source ~/.config/fish/aliases.fish
end

if status --is-login
    # Only run Neofetch if not in a tmux session
    # if not set -q TMUX
    #     neofetch
    # end
    # neofetch
    # command -qv neofetch && neofetch
else
    # exec fish -l
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
# source ~/.orbstack/shell/init2.fish 2>/dev/null || :
