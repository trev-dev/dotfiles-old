#! /usr/bin/bash
ln -s ~/.dotfiles/nvim ~/.local/share/nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
exec nvim -c "PlugInstall"
