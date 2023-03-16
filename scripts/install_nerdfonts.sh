#!/bin/bash

sudo mkdir ~/.local/share/fonts

cd /tmp
fonts=(
"FiraCode"
"Go-Mono"
"Hack"
"Inconsolata"
"Iosevka"
"JetBrainsMono"
"Mononoki"
"RobotoMono"
"SourceCodePro"
)

for font in ${fonts[@]}
do
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/$font.zip
    sudo unzip $font.zip -d $HOME/.local/share/fonts/$font/
    rm $font.zip
done
fc-cache

# consider install others icon emoji fonts:
# Noto Color Emoji
# Noto Emoji
# ttf-vlgothic (forz Japanese)
#  (´;ω;`)
