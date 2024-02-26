{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gcc
    python312
    nodejs
    rustup
    go
    unstable.neovim
  ];
}
