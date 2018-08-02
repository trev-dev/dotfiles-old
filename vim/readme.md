# Just my personal VIM Setup

If you clone this for your own use, know that it requires VIM 8.0+

* Clone this repo into ~/.vim
```
git clone git@github.com:trev-dev/vim-setup.git ~/.vim
```
* Create a symlink to ~/ for .vimrc
* Run Vim and :PluginInstall 
* [Compile YouCompleteMe](https://github.com/Valloric/YouCompleteMe) 

If you're on a Ubuntu system with Python installed, you can be lazy. Just go into ~/.vim and run my install script. If Vim throws any errors due to a setting that's dependant on a package that's not yet installed, just hit enter. _This script does not include the required YCM dependencies_. It also compiles YCM with --js-completer, so make sure nodejs 7+ is installed.
```
cd ~/.vim && ./install.sh
```
