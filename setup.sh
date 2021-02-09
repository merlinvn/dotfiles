#!/bin/bash
rm -f ~/.gitconfig
rm -f ~/.inputrc
rm -f ~/.zshrc
rm -f ~/.bashrc
rm -f ~/.vimrc
rm -f ~/.bash_aliases
rm -f ~/.config/nvim/init.vim

# #install vimplug for neovim
# curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
				 # https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# #install vimplug for vim legaxy
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
			# https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.inputrc ~/.inputrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.bash_aliases ~/.bash_aliases

mkdir -p ~/.vim/plugin
mkdir -p ~/.config/nvim/plugin
mkdir -p ~/.config/nvim/after/plugin
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
