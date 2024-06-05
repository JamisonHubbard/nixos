#!/usr/bin/env bash

swww init
swww img /home/jamison/nixos/themes/current/image &

killall .nm-applet-wrapped
nm-applet --indicator &

killall .dunst-wrapped
dunst &

killall .waybar-wrapped
waybar &
