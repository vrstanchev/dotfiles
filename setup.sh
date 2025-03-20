#!/bin/sh

# Update package list
sudo apt update

# Install Vim, Git, Zathura, and lf (Vim-like file manager)
sudo apt install -y vim git zathura lf

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
    name = Your Name
    email = your.email@example.com

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

# Configure lf (file manager) with Vim keybindings
mkdir -p ~/.config/lf
cat <<EOF > ~/.config/lf/lfrc
set hidden
set previewer ~/.config/lf/pv.sh
map i open
map l open
map h up
map j down
map k up
EOF

# Create a basic file previewer for lf
cat <<EOF > ~/.config/lf/pv.sh
#!/bin/sh
case "\$1" in
    *.txt|*.md) bat --style=plain --paging=never "\$1";;
    *.png|*.jpg|*.jpeg) chafa "\$1";;
    *.pdf) pdftotext "\$1" -;;
esac
EOF
chmod +x ~/.config/lf/pv.sh

echo "Minimal setup for Vim, Git, Zathura, and lf completed!"
