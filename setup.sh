#!/usr/bin/env bash

# Install programs(apt)
sudo apt-get install bspwm sxhkd polybar rofi zsh ranger nitrogen llvm clang \
    python git fzf neofetch lua firefox cmake make

# Neovim source
git clone https://github.com/neovim/neovim.git

# Install neovim plugin manager(vim plug)
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Copy configuration files
cp -r bspwm sxhkd ranger polybar nvim $HOME/.config/
cp .zshrc .Xresources $HOME/
