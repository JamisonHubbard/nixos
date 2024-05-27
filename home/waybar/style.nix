{ ... }: 
let
  custom = {
    font = "RobotoMono Nerd Font";
    fontsize = "12";
    primary_accent = "#89b4fa";
    secondary_accent = "#8be8ad";
    tertiary_accent = "#f5f5f5";
    primary_background_color = "rgba(17, 17, 27, 1)";
    secondary_background_color = "#89b4fa";
    tertiary_background_color = "#25253a";
    background = "#11111B";
    opacity = "0.85";
    cursor = "Numix-Cursor";
    };
in
{
  programs.waybar.style = ''
* {
    border: none;
    border-radius: 0px;
    font-family: ${custom.font};
    font-size: 14px;
    min-height: 0;
}

#window {
    background: ${custom.tertiary_background_color};
    padding-left: 15px;
    padding-right: 15px;
    border-radius: 16px;
    margin-top: 5px;
    margin-bottom: 5px;
    font-weight: normal;
    font-style: normal;
}

window#waybar {
    background: ${custom.primary_background_color};
}

#cava.left, #cava.right {
    background: ${custom.tertiary_background_color};
    margin: 5px;
    padding: 8px 16px;
    color: ${custom.primary_accent};
}

#cava.left {
    border-radius: 24px 10px 24px 10px;
}

#cava.right {
    border-radius: 10px 24px 10px 24px;
}

#workspaces {
    background: ${custom.tertiary_background_color};
    margin: 5px 5px;
    padding: 8px 5px;
    border-radius: 16px;
    color: ${custom.primary_accent};
}

#workspaces button {
    padding: 0px 5px;
    margin: 0px 3px;
    border-radius: 16px;
    color: transparent;
    background: ${custom.primary_background_color};
    transition: all 0.3s ease-in-out;
}

#workspaces button.active {
    background-color: ${custom.secondary_accent};
    color: ${custom.background};
    border-radius: 16px;
    min-width: 50px;
    background-size: 400% 400%;
    transition: all 0.3s ease-in-out;
}

#workspaces button:hover {
    background-color: ${custom.tertiary_accent};
    color: ${custom.background};
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
    background: ${custom.tertiary_background_color};
    font-weight: bold;
    margin: 5px 0px;
}

#tray,
#network,
#bluetooth,
#battery,
#hardware {
    color: ${custom.tertiary_accent};
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
    color: ${custom.tertiary_accent};
}

#custom-playerctl.back,
#custom-playerctl.next {
    color: ${custom.primary_accent};
}

#custom-playerctl.play {
    color: ${custom.secondary_accent};
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
    background: ${custom.tertiary_background_color};
    color: ${custom.tertiary_accent};
    padding: 0 20px;
    border-radius: 24px 10px 24px 10px;
    margin: 5px 0;
    font-weight: bold;
}

#user {
    color: ${custom.tertiary_accent};
    background: ${custom.tertiary_background_color};
    border-radius: 0px 0px 40px 0px;
    padding: 10px 25px 15px 10px;
    margin-right: 7px;
    font-weight: bold;
    font-size: 14px;
}

#clock {
    color: ${custom.tertiary_accent};
    background: ${custom.tertiary_background_color};
    border-radius: 0px 0px 0px 40px;
    padding: 10px 10px 15px 25px;
    margin-left: 7px;
    font-weight: bold;
    font-size: 14px;
}
  '';
}
