{ ... }: {
    programs.swaylock = {
        enable = true;
        settings = {
            "ignore-empty-password" = true;
            font = "RobotoMono Nerd Font";

            clock = true;
            timestr = "%R";
            datestr = "%a, %e of %B";

            image = "/home/jamison/wallpapers/current";

            "fade-in" = 1;

            "effect-pixelate" = 5;

            indicator = true;
            "indicator-radius" = 300;
            "indicator-thickness" = 20;
            "indicator-caps-lock" = false;

            "disable-caps-lock-text" = true;

            "key-hl-color" = "#00000066";
            "separator-color" = "#00000000";

            "inside-color" = "#00000033";
            "inside-clear-color" = "#ffffff00";
            "inside-caps-lock-color" = "#ffffff00";
            "inside-ver-color" = "#ffffff00";
            "inside-wrong-color" = "#ffffff00";

            "ring-color" = "#ffffff";
            "ring-clear-color" = "#ffffff";
            "ring-caps-lock-color" = "#ffffff";
            "ring-ver-color" = "#ffffff";
            "ring-wrong-color" = "#ffffff";

            "line-color" = "#00000000";
            "line-clear-color" = "#ffffffff";
            "line-caps-lock-color" = "#ffffffff";
            "line-ver-color" = "#ffffffff";
            "line-wrong-color" = "#ffffffff";

            "text-color" = "#ffffff";
            "text-clear-color" = "#ffffff";
            "text-ver-color" = "#ffffff";
            "text-wrong-color" = "#ffffff";

            "bs-hl-color" = "#ffffff";
            "caps-lock-key-hl-color" = "#ffffffff";
            "caps-lock-bs-hl-color" = "#ffffffff";
            "text-caps-lock-color" = "#ffffffff";
        };
    };
}
