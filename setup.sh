#!/usr/bin/bash
# TODO: Did I forget anything?

# Install programs(apt)
sudo apt-get install bspwm sxhkd polybar alacritty rofi picom zsh feh ranger \
    llvm clang python git fzf neofetch lolcat nnn lua

# Neovim source
git clone https://github.com/neovim/neovim.git

# Install neovim plugin manager(vim plug)
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Copy configuration files
cp -r alacritty $HOME/.config
cp -r bspwm $HOME/.config
cp -r sxhkd $HOME/.config
cp -r picom $HOME/.config
cp -r ranger $HOME/.config
cp -r polybar $HOME/.config
cp -r nvim $HOME/.config
cp -r wallpapers $HOME/Downloads
cp .zshrc $HOME

# Set wallpaper
feh --bg-scale $HOME/Downloads/wallpapers/forest.png
