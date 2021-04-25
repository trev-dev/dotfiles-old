#! /usr/bin/bash

cd ~/.dotfiles/bashrc
ln -s $(pwd)/.aliases $HOME/.aliases

ln -s $(pwd)/.bash_profile $HOME/.bash_profile

ln -s $(pwd)/.bash_prompt $HOME/.bash_prompt

ln -s $(pwd)/.bashrc $HOME/.bashrc

source $HOME/.bashrc
