#!/bin/bash

rm -f ~/.inputrc
rm -f ~/.zshrc
rm -f ~/.bashrc
rm -f ~/.profile
rm -f ~/.bash_aliases
#rm -rf ~/.xinitrc
stow shell

rm -rf ~/.config/alacritty
stow alacrity


rm -f ~/.config/starship.toml
stow starship

rm -rf ~/.gitconfig
stow git

rm -rf ~/.config/i3
stow i3

rm -rf ~/.config/picom
stow picom

rm -f ~/.vimrc
rm -rf ~/.vim
stow vim

rm -rf ~/.config/nvim
stow nvim

stow tmux

mkdir -p $HOME/.local/bin
stow scripts

rm -f ~/viminfo
touch ~/viminfo
chmod 700 ~/viminfo

# rm -rf ~/.stalonetrayrc
# stow stanlonetrayrc

# rm -rf ~/.xmonad
# stow xmonad

# rm -rf ~/.config/xmobar
# stow xmobar

# rm -rf ~/.config/rofi
# stow rofi

# rm -rf ~/.config/dunst
# stow dunst

# rm -rf ~/.config/betterlockscreenrc
# stow betterlockscreenrc

# rm -rf ~/.config/polybar
# stow polybar

# rm -rf ~/.config/leftwm
# stow leftwm

