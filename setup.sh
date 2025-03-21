#!/bin/sh

# Update package list
sudo apt update

# Install Vim, Git, Zathura, nnn, screenkey, and gxkb
sudo apt install -y vim git zathura nnn screenkey gxkb

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

# Set up gxkb with English and Bulgarian layouts
mkdir -p ~/.config/gxkb
cat <<EOF > ~/.config/gxkb/gxkb.cfg
[layout]
default_layout=us,bg
EOF

# Set wallpaper
mv puma.jpg ~/
feh --bg-scale ~/puma.jpg

echo "Minimal setup for Vim, Git, Zathura, nnn, and gxkb (EN/BG layouts) completed!"
