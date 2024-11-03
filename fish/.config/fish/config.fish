set fish_greeting ""

set SHELL (which fish)

# aliases
source (dirname (status --current-filename))/aliases.fish

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

# Rust
fish_add_path $HOME/.cargo/bin

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
fish_add_path $GOPATH/bin

# Neovim
fish_add_path $HOME/.local/share/bob/nvim-bin

command -qv nvim && set -gx EDITOR nvim

# starship
command -qv starship && starship init fish | source

# color scheme
source (dirname (status --current-filename))/tokyonight_night.fish

# OS specific configuration
switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

# neofetch
command -qv neofetch && neofetch
