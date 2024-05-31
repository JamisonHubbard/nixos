{
    colors,
    ...
}: {
  programs.waybar.style = ''
* {
    border: none;
    border-radius: 0px;
    font-family: "RobotoMono Nerd Font";
    font-size: 14px;
    min-height: 0;
}

#window {
    background: #${colors.blue_dark_muted};
    padding-left: 15px;
    padding-right: 15px;
    border-radius: 16px;
    margin-top: 5px;
    margin-bottom: 5px;
    font-weight: normal;
    font-style: normal;
}

window#waybar {
    background: #${colors.black};
}

#cava.left, #cava.right {
    background: #${colors.blue_dark_muted};
    margin: 5px;
    padding: 8px 16px;
    color: #${colors.primary_accent};
}

#cava.left {
    border-radius: 24px 10px 24px 10px;
}

#cava.right {
    border-radius: 10px 24px 10px 24px;
}

#workspaces {
    background: #${colors.blue_dark_muted};
    margin: 5px 5px;
    padding: 8px 5px;
    border-radius: 16px;
    color: #${colors.primary_accent};
}

#workspaces button {
    padding: 0px 5px;
    margin: 0px 3px;
    border-radius: 16px;
    color: transparent;
    background: #${colors.black};
    transition: all 0.3s ease-in-out;
}

#workspaces button.active {
    background-color: #${colors.secondary_accent};
    color: #${colors.black};
    border-radius: 16px;
    min-width: 50px;
    background-size: 400% 400%;
    transition: all 0.3s ease-in-out;
}

#workspaces button:hover {
    background-color: #${colors.primary_accent};
    color: #${colors.black};
    border-radius: 16px;
    min-width: 50px;
    background-size: 400% 400%;
}

#tray,
#network,
#bluetooth,
#battery,
#hardware,
#custom-playerctl.back,
#custom-playerctl.play,
#custom-playerctl.next {
    background: #${colors.blue_dark_muted};
    font-weight: bold;
    margin: 5px 0px;
}

#tray,
#network,
#bluetooth,
#battery,
#hardware {
    color: #${colors.white};
    border-radius: 10px 24px 10px 24px;
    padding: 0px 20px;
    margin-left: 7px;
}

#cpu,
#disk,
#memory {
    padding: 0px 2px;
    margin-left: 2px;
}

#custom-playerctl.back,
#custom-playerctl.play,
#custom-playerctl.next {
    font-size: 22px;
}

#custom-playerctl.back:hover,
#custom-playerctl.play:hover,
#custom-playerctl.next:hover {
    color: #${colors.white};
}

#custom-playerctl.back,
#custom-playerctl.next {
    color: #${colors.primary_accent};
}

#custom-playerctl.play {
    color: #${colors.secondary_accent};
    padding: 0px 5px;
}

#custom-playerctl.back {
    border-radius: 24px 0px 0px 10px;
    padding-left: 16px;
    margin-left: 7px;
}

#custom-playerctl.next {
    border-radius: 0px 10px 24px 0px;
    padding-right: 12px;
    margin-right: 7px;
}

#custom-player,
#pulseaudio {
    background: #${colors.blue_dark_muted};
    color: #${colors.white};
    padding: 0 20px;
    border-radius: 24px 10px 24px 10px;
    margin: 5px 0;
    font-weight: bold;
}

#user {
    color: #${colors.tertiary_accent};
    background: #${colors.blue_dark_muted};
    border-radius: 0px 0px 40px 0px;
    padding: 10px 25px 15px 10px;
    margin-right: 7px;
    font-weight: bold;
    font-size: 14px;
}

#clock {
    color: #${colors.tertiary_accent};
    background: #${colors.blue_dark_muted};
    border-radius: 0px 0px 0px 40px;
    padding: 10px 10px 15px 25px;
    margin-left: 7px;
    font-weight: bold;
    font-size: 14px;
}
  '';
}
