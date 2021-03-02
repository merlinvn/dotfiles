#!/bin/bash
rm -f ~/.gitconfig
rm -f ~/.inputrc
rm -f ~/.zshrc
rm -f ~/.bashrc
rm -f ~/.vimrc
rm -f ~/.bash_aliases
rm -f ~/.profile
rm -rf ~/.xinitrc
rm -rf ~/.stalonetrayrc

rm -f ~/.config/nvim/init.vim
rm -f ~/.xmonad/xmonad.hs
rm -f ~/.config/xmobar/xmobar.hs
rm -f ~/.config/alacritty/alacritty.yml
rm -f ~/.config/rofi/config.rasi
rm -f ~/.config/picom/picom.conf
rm -f ~/.config/dunst/dunstrc
rm -rf ~/.config/betterlockscreenrc
rm -rf ~/.config/polybar/config
rm -rf ~/.config/leftwm/config.toml
rm -rf ~/.config/leftwm/themes/current

ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.inputrc ~/.inputrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.bash_aliases ~/.bash_aliases
ln -s ~/dotfiles/.profile ~/.profile
ln -s ~/dotfiles/.xinitrc ~/.xinitrc
ln -s ~/dotfiles/.stalonetrayrc ~/.stalonetrayrc

mkdir -p ~/.xmonad
ln -s ~/dotfiles/.xmonad/xmonad.hs ~/.xmonad/xmonad.hs

mkdir -p ~/.config/xmobar
ln -s ~/dotfiles/.config/xmobar/xmobar.hs ~/.config/xmobar/xmobar.hs

mkdir -p ~/.config/alacritty
ln -s ~/dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

mkdir -p ~/.config/rofi
ln -s ~/dotfiles/.config/rofi/config.rasi ~/.config/rofi/config.rasi

mkdir -p ~/.config/picom
ln -s ~/dotfiles/.config/picom/picom.conf ~/.config/picom/picom.conf

mkdir -p ~/.config/dunst
ln -s ~/dotfiles/.config/dunst/dunstrc ~/.config/dunst/dunstrc

ln -s ~/dotfiles/.config/betterlockscreen/betterlockscreenrc ~/.config/betterlockscreenrc

mkdir -p ~/.config/polybar
ln -s ~/dotfiles/.config/polybar/config ~/.config/polybar/config

mkdir -p ~/.config/leftwm/themes/
ln -s ~/dotfiles/.config/leftwm/config.toml ~/.config/leftwm/config.toml
ln -s ~/dotfiles/.config/leftwm/themes/current ~/.config/leftwm/themes/current

mkdir -p ~/.vim/plugin
mkdir -p ~/.vim/after/syntax
mkdir -p ~/.config/nvim/plugin
mkdir -p ~/.config/nvim/after/plugin
mkdir -p ~/.config/nvim/after/syntax
mkdir -p ~/.config/nvim/lua
ln -s ~/dotfiles/.vimrc ~/.config/nvim/init.vim

# link setting
for f in `find ./vim_config -regex ".*\.vim$\|.*\.lua$"`; do
  rm -rf ~/.vim/${f:13}
  rm -rf ~/.config/nvim/${f:13}

  ln -s ~/dotfiles/${f:2} ~/.vim/${f:13}
  ln -s ~/dotfiles/${f:2} ~/.config/nvim/${f:13}
done


# link Starship settings
rm -f ~/.config/starship.toml
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml

rm -f ~/viminfo
touch ~/viminfo
chmod 700 ~/viminfo
