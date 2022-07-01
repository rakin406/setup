#!/usr/bin/env bash
# Run with sudo

# Install programs(apt)
apt update && apt upgrade
apt install bspwm sxhkd polybar zsh ranger
./install-neovim.sh

# Copy configuration files
cp -r bspwm sxhkd ranger polybar nvim "$HOME"/.config/
cp .zshrc .Xresources "$HOME"/
