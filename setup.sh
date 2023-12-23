#!/usr/bin/env bash
# Run with sudo

# Install programs(apt)
apt update && apt upgrade
apt install neofetch lsd git zsh ranger fonts-powerline fzf nnn
./scripts/install-neovim.sh

# make zsh the default shell
chsh -s $(which zsh)
# install ohmyzsh
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.zsh/fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# Copy configuration files
cp -r alacritty kitty nvim "$HOME"/.config/
cp dotfiles/.zshrc dotfiles/.tmux.conf "$HOME"/

# Install all powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts && ./install.sh
# clean-up a bit
cd ..
rm -rf fonts
