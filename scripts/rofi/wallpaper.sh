#!/bin/sh
# Path to wallpaper folders
WALLPAPERS=~/wallpapers
cd $WALLPAPERS
selected=$(ls $WALLPAPERS|rofi -dmenu -p "Select a wallpaper: ")&&nitrogen --set-zoom-fill --save "${selected}"
