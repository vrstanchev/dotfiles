#!/bin/sh

# Update package list
sudo apt update

# Install Vim, Git, Zathura, and nnn (Vim-like file manager)
sudo apt install -y vim git zathura nnn screenkey

# Create a minimal Vim configuration
cat <<EOF > ~/.vimrc
set nocompatible
set number
set relativenumber
syntax on
set expandtab shiftwidth=4 softtabstop=4
set autoindent
set hlsearch incsearch
set clipboard=unnamedplus
EOF

# Configure Git
cat <<EOF > ~/.gitconfig
[user]
    name = vrstanchev
    email = vrstanchev@gmail.com

[core]
    editor = vim
EOF

# Create Zathura config directory and minimal config
mkdir -p ~/.config/zathura
cat <<EOF > ~/.config/zathura/zathurarc
set recolor true
set statusbar-h-padding 5
set statusbar-v-padding 5
set smooth-scroll true
EOF

# Configure nnn with Vim-like keybindings
mkdir -p ~/.config/nnn
cat <<EOF > ~/.config/nnn/nnnrc
set hidden
set icons
set showdetail
EOF

# Enable nnn plugins (optional)
mkdir -p ~/.config/nnn/plugins
curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh

# Create an alias for nnn with plugins enabled
echo 'alias n="nnn -e"' >> ~/.bashrc
mv puma.jpg ~/
feh --bg-scale puma.jpg

echo "Minimal setup for Vim, Git, Zathura, and nnn completed!"
