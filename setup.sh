#!/usr/bin/env bash

# Install programs(apt)
sudo apt-get install bspwm sxhkd polybar zsh ranger git

# Install latest version of neovim
git clone https://github.com/rakin406/useful-scripts.git
./useful-scripts/scripts/install-neovim.sh

# Install neovim plugin manager(vim plug)
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Copy configuration files
cp -r bspwm sxhkd ranger polybar nvim $HOME/.config/
cp .zshrc .Xresources $HOME/

mkdir -p $HOME/code
