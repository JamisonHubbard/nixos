#!/usr/bin/env bash

killall swww-daemon
swww init
swww img /home/jamison/nixos/wallpapers/current

killall .nm-applet-wrapped
nm-applet --indicator

killall .dunst-wrapped
dunst

killall .waybar-wrapped
waybar &
