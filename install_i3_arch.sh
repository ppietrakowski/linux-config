#!/bin/bash

sudo pacman -Syu
SCRIPT=$(readlink -f "$0")
LASTPATH=$(dirname "$SCRIPT")

mkdir -p /tmp/i3install-$USER
cd /tmp/i3install-$USER
sudo pacman -S --needed i3-wm imagemagick bc xorg-xrandr feh firefox thunar terminator base-devel adwaita-fonts ttf-droid ttf-font-awesome

if ["$(pacman -Qs i3lock-color)" = ""];
then
	git clone --recursive https://aur.archlinux.org/i3lock-color.git
	cd i3lock-color
	makepkg -si
	cd ..
fi


if ["$(pacman -Qs betterlockscreen)" = ""];
then
	git clone --recursive https://aur.archlinux.org/betterlockscreen.git
	cd betterlockscreen
	makepkg -si
fi

# back to root installation folder
cd $LASTPATH
echo $LASTPATH
mkdir -p /home/$USER/.config/i3/
cp -v i3/config /home/$USER/.config/i3/config
cp -v i3/i3status.conf /home/$USER/.config/i3/i3status.conf 
