#!/usr/bin/env bash
# Install the latest version of neovim

sudo rm /usr/local/bin/nvim
rm -rf neovim
git clone https://github.com/neovim/neovim.git
cd neovim || exit
make CMAKE_BUILD_TYPE=Release
sudo make install
cd ..
rm -rf neovim
