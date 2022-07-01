#!/usr/bin/env bash
# Run with sudo

# Install programs(apt)
apt update && apt upgrade
apt install git zsh ranger fonts-powerline fzf nnn
./install-neovim.sh

# make zsh the default shell
chsh -s $(which zsh)
# install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# Install image previewer for ranger
pip3 install ueberzug

# Copy configuration files
cp -r ranger nvim "$HOME"/.config/
cp .zshrc .Xresources "$HOME"/

# Install all powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts && ./install.sh
# clean-up a bit
cd ..
rm -rf fonts
