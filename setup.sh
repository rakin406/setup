#!/usr/bin/env bash
# Run with sudo

# Install programs(apt)
apt update && apt upgrade
apt install git bspwm sxhkd polybar zsh ranger fonts-powerline
./install-neovim.sh

# Copy configuration files
cp -r bspwm sxhkd ranger polybar nvim "$HOME"/.config/
cp .zshrc .Xresources "$HOME"/

# Install all powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
