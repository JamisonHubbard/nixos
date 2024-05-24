!#/usr/bin/env bash

# wallpaper
swww init &
swww img ~/wallpapers/astronaut.png &

# network manager applet in waybar
nm-applet --indicator &

# bar
waybar &

# notification daemon
dunst
