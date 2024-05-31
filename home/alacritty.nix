{
    colors,
    ...
}: {
    programs.alacritty = {
        enable = true;
        settings = {
            window = {
                opacity = 0.95;
                blur = true;
                padding = {
                    x = 15;
                    y = 15;
                };
            };

            font = {
                size = 14.0;
                normal = {
                    family = "FiraMono Nerd Font";
                    style = "Regular";
                };
            };

            colors.primary = {
                background = "#${colors.blue_dark}";
                foreground = "#${colors.grey_blue}";
            };

            colors.cursor = {
                text = "#${colors.grey_blue}";
                cursor = "#${colors.grey}";
            };

            colors.normal = {
                black = "#${colors.blue_muted}";
                red = "#${colors.pink}";
                green = "#${colors.turquoise}";
                yellow = "#${colors.yellow_muted}";
                blue = "#${colors.blue}";
                magenta = "#${colors.red_light}";
                cyan = "#${colors.blue_light}";
                white = "#${colors.grey_light}";
            };

            colors.bright = {
                black = "#${colors.grey_blue}";
                red = "#${colors.pink_light}";
                green = "#${colors.turquoise}";
                yellow = "#${colors.yellow_muted}";
                blue = "#${colors.blue_light_muted}";
                magenta = "#${colors.orange_light}";
                cyan = "#${colors.turquoise_light}";
                white = "#${colors.grey_light}";
            };
        };
    };
}
