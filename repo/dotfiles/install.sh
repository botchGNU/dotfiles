#!/bin/sh

if [ $# -eq 0 ]; then
    # Save Password
    read -sp "Password: " password
else
    password=$1
fi

# Refresh
echo "$password" | sudo -S apt-get -y update
echo "$password" | sudo -S apt-get -y upgrade

# Basic dependencies
echo "$password" | sudo -S apt-get install -y zsh vim

# Update DemonCloud's Vim config
echo $password | source <(curl -L https://raw.githubusercontent.com/DemonCloud/dotfile/master/install.sh)

# Set theme
xfconf-query -c xsettings -p /Net/ThemeName -s "ceres-pro@2"