#!/usr/bin/env bash

# Install all dependencies
sudo apt install clang build-essential ninja-build gettext libtool libtool-bin \
    autoconf automake cmake g++ pkg-config unzip curl doxygen git

# Install the latest version of neovim
sudo rm /usr/local/bin/nvim
rm -rf neovim
git clone https://github.com/neovim/neovim.git
cd neovim || exit
make CMAKE_BUILD_TYPE=Release
sudo make install
cd ..
rm -rf neovim

# Install all the plugins using vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +PlugInstall +qall
