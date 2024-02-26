{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    curl
    unzip
    stow
    zsh
    autojump
    fzf
    starship
    lazygit
    ripgrep
  ];
}

