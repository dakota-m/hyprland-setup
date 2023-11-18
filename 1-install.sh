#!/bin/bash
#  _   _                    ____  _             _
# | | | |_   _ _ __  _ __  / ___|| |_ __ _ _ __| |_ ___ _ __
# | |_| | | | | '_ \| '__| \___ \| __/ _` | '__| __/ _ \ '__|
# |  _  | |_| | |_) | |     ___) | || (_| | |  | ||  __/ |
# |_| |_|\__, | .__/|_|    |____/ \__\__,_|_|   \__\___|_|
#        |___/|_|
#
# by Dakota Martin (2023)
# modified from Stephan Raabe
# -----------------------------------------------------

# ------------------------------------------------------
# Confirm Start
# ------------------------------------------------------
clear
echo ""
echo "WELCOME TO THE HYPRLAND STARTER INSTALLATION SCRIPT"
echo "------------------------------------------------------"
echo ""
echo "Please make sure that you run this script from $HOME/hyprland-starter/"
echo "Backup existing configurations in .config if needed."
echo ""
while true; do
	read -p "DO YOU WANT TO START THE INSTALLATION NOW? (Yy/Nn): " yn
	case $yn in
	[Yy]*)
		echo "Installation started."
		break
		;;
	[Nn]*)
		exit
		break
		;;
	*) echo "Please answer yes or no." ;;
	esac
done

sudo pacman -S hyprland waybar rofi wofi kitty alacritty wezterm dunst dolphin xdg-desktop-portal-hyprland qt5-wayland qt6-wayland hyprpaper chromium ttf-font-awesome

while true; do
	echo ""
	read -p "DO YOU WANT TO COPY THE FILES INTO .config? YOU CAN ALSO DO THIS MANUALLY (Yy/Nn): " yn
	case $yn in
	[Yy]*)
		cp -r ~/hyprland-starter/* ~/.config/
		echo "Configuration files successfully copied to ~/.config/"
		break
		;;
	[Nn]*)
		exit
		break
		;;
	*) echo "Please answer yes or no." ;;
	esac
done

echo ""
echo "DONE!"
echo "Open ~/.config/hypr/hyprland.conf to change your keyboard layout (default is us) and your screenresolution (default is preferred) if needed."
echo "Then reboot your system!"
