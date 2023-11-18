# Hyprland Starter

To make it easy to start with Hyprland, you can find here a basic configuration and an installation script.
The default configuration files are already available in the corresponding folder.
Perfect starting point for your customization experiments.

## Requirements

This script requires an Arch Linux based distribution. Tested on Manjaro, EndeavourOS, Arco Linux and Arch Linux.

NVIDIA installation for Hyprland is not covered in this script. Please read: https://wiki.hyprland.org/Nvidia/

git must be installed.
```
sudo pacman -S git
```


## Packages

The script will install the following packages:

- Window Manager: hyprland 
- Status Bar: waybar 
- Launcher: rofi 
- Launcher: wofi #optional
- Terminal: kitty #optional
- Terminal: alacritty 
- Notification Service: dunst 
- File Manager: dolphin 
- xdg-desktop-portal-hyprland 
- qt5-wayland 
- qt6-wayland 
- Wallpaper: hyprpaper
- Icons: ttf-font-awesome

## Installation

```
# Move to your home directory
cd

# Clone the packages
git clone https://gitlab.com/stephan-raabe/hyprland-starter.git

# You can also download the files and unzip it into your home folder

# Move into the folder
cd hyprland-starter

# Start the script
./1-install.sh
```

## Key Bindings

The following custom key bindings are enabled (can be customized in ~/.config/hypr/hyprland.conf

- SUPER + RETURN to start terminal alacritty
- SUPER + Q to quit an application
- SUPER + B to start browser chromium
- SUPER + M to exit Hyprland
- SUPER + E to start filemanager dolphin
- SUPER + CTRL + RETURN to start launcher rofi
- SUPER + T to toggle floating
- SUPER + F to toggle fullscreen
- SUPER + 1-9 to switch workspaces
- more key bindings in ~/.config/hypr/hyprland.conf

