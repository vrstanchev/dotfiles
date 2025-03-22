#!/bin/bash

# Update package list
sudo apt update

# Install Vim, Git, Zathura, nnn, screenkey, and gxkb
sudo apt install -y vim git zathura nnn screenkey gxkb fzf

# Create a minimal Vim configuration
cat <<EOF > ~/.vimrc
set nocompatible
set number
set relativenumber
syntax on
set expandtab 
set shiftwidth=4 
set softtabstop=4
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
set background dark
set font 'Monospace 20'
set smooth-scroll true
set zoom 100
set mouse-enabled true
map <C-l> reload
map <C-q> quit
map <C-+> zoom-in
map <C--> zoom-out
set search-engine 'fzf'
set highlight-sync true

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
[xkb config]
group_policy=2
default_group=0
never_modify_config=false
model=pc105
layouts=us,bg
variants=
toggle_option=grp:alt_shift_toggle
compose_key_position=
EOF

# Set wallpaper
mv puma.jpg ~/
feh --bg-scale ~/puma.jpg

echo "Minimal setup for Vim, Git, Zathura, nnn, and gxkb (EN/BG layouts) completed!"
