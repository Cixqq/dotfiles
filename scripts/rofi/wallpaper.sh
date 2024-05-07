#!/bin/bash
# Path to wallpaper folders
WALLPAPERS=$HOME/wallpapers
rofi_cmd() {
    rofi -dmenu -theme ${HOME}/.config/rofi/configs/wallpaper.rasi -p "Select a wallpaper: "
}

selected=$(ls $WALLPAPERS | while read -r A ; do  echo -en "$A\x00icon\x1f""${WALLPAPERS}"/"$A\n" ; done | rofi_cmd)
nitrogen --set-zoom-fill --save $WALLPAPERS/"${selected}"
