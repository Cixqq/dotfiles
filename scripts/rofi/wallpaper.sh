#!/bin/sh
# Path to wallpaper folders
WALLPAPERS=~/wallpapers
cd $WALLPAPERS
selected=$(ls $WALLPAPERS|rofi -dmenu -p "Random Wallpaper Folder: ")&&nitrogen --set-zoom-fill --save "${selected}"
