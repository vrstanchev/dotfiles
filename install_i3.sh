#!/bin/bash

# Remove XFCE4
sudo apt remove --purge -y xfce4 xfce4-* thunar
sudo apt autoremove -y

# Install i3 and utilities
sudo apt install -y i3 rofi dmenu feh picom i3status i3lock

# Set up i3 configuration
mkdir -p ~/.config/i3 ~/.config/i3status

# Check if user has a dotfiles directory
if [ -d "~/dotfiles/i3" ]; then
    cp ~/dotfiles/i3/config ~/.config/i3/config
    cp ~/dotfiles/i3status/config ~/.config/i3status/config
    echo "Custom i3 configs applied."
else
    echo "No custom configs found. Using default i3 config."
    cp /etc/i3/config ~/.config/i3/config
fi

# Set i3 as default session
echo "exec i3" > ~/.xsession

# If LightDM is installed, configure it for i3
if [ -d "/etc/lightdm" ]; then
    echo "[Seat:*]
user-session=i3" | sudo tee /etc/lightdm/lightdm.conf.d/50-i3.conf
fi

# Restart i3
if pgrep -x "i3" > /dev/null; then
    i3-msg restart
else
    echo "i3 is not running. Please log out and log back in."
fi

# Done
echo "Setup complete. Rebooting now..."
sleep 3
reboot
