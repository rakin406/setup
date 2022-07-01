#!/usr/bin/env bash
# Run with sudo

# Install programs(apt)
apt update && apt upgrade
apt install git python3 bspwm sxhkd zsh ranger fonts-powerline fzf nnn
./install-neovim.sh

# Install all dependencies for polybar
apt install cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev \
    libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev \
    libxcb-xkb-dev pkg-config python3-xcbgen xcb-proto libxcb-xrm-dev i3-wm \
    libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev

# additional dependencies
apt install libxcb-composite0-dev libjsoncpp-dev clang build-essential python3-sphinx
ln -s /usr/include/jsoncpp/json/ /usr/include/json

# install polybar
git clone https://github.com/jaagr/polybar.git
cd polybar && ./build.sh
cd ..
rm -rf polybar

# make zsh the default shell
chsh -s $(which zsh)
# install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# Copy configuration files
cp -r bspwm sxhkd ranger polybar nvim "$HOME"/.config/
cp .zshrc .Xresources "$HOME"/

# Install all powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts && ./install.sh
# clean-up a bit
cd ..
rm -rf fonts
