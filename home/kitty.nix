{
    theme,
    ...
}:
let
    colors = import ../themes/${theme}/colors.nix;
in {
    programs.kitty = {
        enable = true;
        extraConfig = ''
            linux_display_server wayland

            font_family      FiraCode Nerd Font
            bold_font        auto
            italic_font      auto
            bold_italic_font auto
            font_size        14.0

            remember_window_size  no
            window_padding_width  7.5 10

            background_opacity 0.95
            background_blur    1

            background #${colors.blue_dark}
            foreground #${colors.grey_blue}

            # cursor colors
            cursor #${colors.grey}
            cursor_text_color #${colors.grey_blue}

            # black
            color0 #${colors.blue_muted}
            color8 #${colors.grey_blue}

            # red
            color1 #${colors.pink}
            color9 #${colors.pink_light}

            # green
            color2 #${colors.turquoise}
            color10 #${colors.turquoise}

            # yellow
            color3 #${colors.yellow_muted}
            color11 #${colors.yellow_muted}

            # blue
            color4 #${colors.blue}
            color12 #${colors.blue_light_muted}

            # magenta
            color5 #${colors.red_light}
            color13 #${colors.orange_light}

            # cyan
            color6 #${colors.blue_light}
            color14 #${colors.turquoise_light}

            # white
            color7 #${colors.grey_light}
            color15 #${colors.grey_light}
        '';
    };
}
