#!/bin/sh

folder=$(mktemp -d)
cd $folder
curl -L https://github.com/coni/dotfiles/releases/download/1.0/theme-fonts.tar.gz -o theme-fonts.tar.gz
tar xf theme-fonts.tar.gz
mkdir ~/.fonts ~/.themes
cp -r .fonts/* $HOME/.fonts/
cp -r .themes/* $HOME/.themes/
