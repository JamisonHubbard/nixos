{
    theme,
    ...
}:
let
    colors = import ../../themes/${theme}/colors.nix;
in {
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
    font-weight: normal;
    font-style: normal;
}

window#waybar {
    background: #${colors.black};
    opacity: 0.8;
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

#battery,
#bluetooth,
#network,
#hardware,
#tray,
#clock,
#pulseaudio,
#custom-player,
#custom-playerctl.back,
#custom-playerctl.play,
#custom-playerctl.next,
#user {
    background: #${colors.blue_dark_muted};
    font-weight: bold;
    margin: 5px 0px;
}

#battery,
#bluetooth,
#network,
#hardware,
#tray,
#clock,
#pulseaudio,
#custom-player,
#user {
    padding: 0px 20px;
    color: #${colors.grey_light};
}

#battery,
#bluetooth,
#network,
#hardware,
#tray,
#clock {
    border-radius: 10px 24px 10px 24px;
    margin-left: 7px;
}

#pulseaudio,
#custom-player,
#user {
    border-radius: 24px 10px 24px 10px;
    margin-right: 7px;
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
    color: #${colors.grey_light};
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
    padding-left: 12px;
    margin-left: 7px;
}

#custom-playerctl.next {
    border-radius: 0px 10px 24px 0px;
    padding-right: 12px;
    margin-right: 7px;
}

#user {
    color: #${colors.tertiary_accent};
    background: #${colors.blue_dark_muted};
    border-radius: 0px 0px 40px 0px;
    padding: 10px 25px 15px 10px;
    margin-right: 7px;
    margin-top: 0px;
    font-weight: bold;
    font-size: 14px;
}

#clock {
    color: #${colors.tertiary_accent};
    background: #${colors.blue_dark_muted};
    border-radius: 0px 0px 0px 40px;
    padding: 10px 10px 15px 25px;
    margin-left: 7px;
    margin-top: 0px;
    font-weight: bold;
    font-size: 14px;
}
  '';
}
