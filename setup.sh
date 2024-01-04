#!/usr/bin/env bash
# Run with sudo

# Install stuff(apt)
apt update && apt upgrade
apt install neofetch lsd kitty tmux zsh ranger fzf nnn nitrogen picom

# Install neovim dependencies
apt install clang build-essential ninja-build gettext libtool libtool-bin \
    autoconf automake cmake g++ pkg-config unzip curl doxygen git

# make zsh the default shell
chsh -s "$(which zsh)"
# install ohmyzsh
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting \
    ~/.zsh/fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# Remove existing configurations
rm ~/.tmux.conf ~/.zshrc
rm -rf ~/.config/alacritty ~/.config/awesome ~/.config/kitty ~/.config/nvim \
    ~/.config/picom

# Create configuration symlinks
ln -s "$(pwd)"/dotfiles/.tmux.conf ~/.tmux.conf
ln -s "$(pwd)"/dotfiles/.zshrc ~/.zshrc
ln -s "$(pwd)"/alacritty ~/.config/alacritty
ln -s "$(pwd)"/awesome ~/.config/awesome
ln -s "$(pwd)"/kitty ~/.config/kitty
ln -s "$(pwd)"/nvim ~/.config/nvim
ln -s "$(pwd)"/picom ~/.config/picom
