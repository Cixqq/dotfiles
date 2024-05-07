#!/bin/bash

# Options.
wlppr='󰃥  Change Wallpaper'
power='  Power Menu'
launcher='󱓞  Application Launcher'
window='  Switch Window'
clipboard='󱉬  Open Clipboard'
screenshot='󰹑  Take Screenshot'
emoji='󰞅  Open Emoji Selector'
terminal='  Open Terminal'
calc='  Open Calculator'

# Rofi command.
rofi_cmd() {
    rofi -dmenu -p "󱗼 " -no-show-icons -i
}

# The run command.
run_rofi() {
    echo -en "$launcher\n$window\n$wlppr\n$terminal\n$clipboard\n$calc\n$screenshot\n$emoji\n$power" | rofi_cmd
}

selected="$(run_rofi)"
case ${selected} in
    $wlppr)
	exec ~/scripts/rofi/wallpaper.sh
    ;;
    $power)
	exec ~/scripts/rofi/power-menu.sh
    ;;
    $launcher)
	rofi -show combi -display-combi "󱗼 "
    ;;
    $clipboard)
	rofi -modi 'clipboard:greenclip print' -show clipboard -run-command '{cmd}'
    ;;
    $screenshot)
	flameshot gui
    ;;
    $emoji)
	rofi -modi emoji -show emoji
    ;;
    $terminal)
	alacritty
    ;;
    $calc)
	  rofi -show calc -modi calc -no-show-match -no-sort
    ;;
    $window)
	rofi -show window -display-window "󱗼 "
    ;;
esac
