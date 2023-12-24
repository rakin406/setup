#!/usr/bin/env bash
# Run with sudo

# Install stuff(apt)
apt update && apt upgrade
apt install neofetch lsd kitty tmux zsh ranger fzf nnn nitrogen picom

# Install neovim dependencies
apt install clang build-essential ninja-build gettext libtool libtool-bin \
    autoconf automake cmake g++ pkg-config unzip curl doxygen git

# make zsh the default shell
chsh -s $(which zsh)
# install ohmyzsh
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.zsh/fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# Copy configuration files
cp -r awesome picom alacritty kitty nvim "$HOME"/.config/
cp dotfiles/.zshrc dotfiles/.tmux.conf "$HOME"/
