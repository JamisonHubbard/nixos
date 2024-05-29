{ ... }:
let
    custom = {
        primary_accent = "#89b4fa";
        secondary_accent = "#8be8ad";
    };
in {
    imports = [ ./style.nix ];

    nixpkgs.overlays = [
        (self: super: {
            waybar = super.waybar.overrideAttrs (oldAttrs: {
                mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
            });
        })
    ];

    programs.waybar = {
        enable = true;
        settings = [{
            position = "top";
            layer = "top";
            height = 35;
            margin-top = 0;
            margin-bottom = 0;
            margin-left = 0;
            margin-right = 0;
            spacing = 0;

            # module positions
            "modules-left" = [
                "user"
                "custom/player"
                "custom/playerctl#back"
                "custom/playerctl#play"
                "custom/playerctl#next"
                "pulseaudio"
            ];
            "modules-center" = [
                "cava#left"
                "hyprland/workspaces"
                "cava#right"
            ];
            "modules-right" = [
                "battery"
                "bluetooth"
                "network"
                "group/hardware"
                "tray"
                "clock"
            ];

            # user module
            user = {
                format = "{user}";
                interval = 60;
                height = 30;
                width = 30;
                icon = true;
            };

            # player display module
            "custom/player" = {
                format = "{}";
                "return-type" = "json";
                exec = "playerctl -a metadata --format '{\"text\": \"{{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
                "max-length" = 20;
            };

            # player back button
            "custom/playerctl#back" = {
                format = "󰙣 ";
                "on-click" = "playerctl previous";
            };

            # player play/pause button
            "custom/playerctl#play" = {
                format = "{icon}";
                "return-type" = "json";
                exec = "playerctl -a metadata --format '{\"text\": \"{{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
                "on-click" = "playerctl play-pause";
                "format-icons" = {
                    Playing = "<span>󰏥 </span>";
                    Paused = "<span> </span>";
                    Stopped = "<span> </span>";
                };
            };

            # player next button
            "custom/playerctl#next" = {
                format = "󰙡 ";
                on-click = "playerctl next";
            };

            # audio graph - left of center
            "cava#left" = {
                framerate = 60;
                autosens = 1;
                bars = 18;
                lower_cutoff_freq = 50;
                higher_cutoff_freq = 10000;
                method = "pipewire";
                source = "auto";
                stereo = true;
                reverse = false;
                bar_delimiter = 0;
                monstercat = false;
                waves = false;
                input_delay = 2;
                format-icons = [
                    "<span foreground='${custom.primary_accent}'>▁</span>" 
                    "<span foreground='${custom.primary_accent}'>▂</span>" 
                    "<span foreground='${custom.primary_accent}'>▃</span>" 
                    "<span foreground='${custom.primary_accent}'>▄</span>" 
                    "<span foreground='${custom.secondary_accent}'>▅</span>" 
                    "<span foreground='${custom.secondary_accent}'>▆</span>" 
                    "<span foreground='${custom.secondary_accent}'>▇</span>" 
                    "<span foreground='${custom.secondary_accent}'>█</span>" 
                ];
            };

            # audio graph - right of center
            "cava#right" = {
                framerate = 60;
                autosens = 1;
                bars = 18;
                lower_cutoff_freq = 50;
                higher_cutoff_freq = 10000;
                method = "pipewire";
                source = "auto";
                stereo = true;
                reverse = false;
                bar_delimiter = 0;
                monstercat = false;
                waves = false;
                input_delay = 2;
                format-icons = [
                    "<span foreground='${custom.primary_accent}'>▁</span>" 
                    "<span foreground='${custom.primary_accent}'>▂</span>" 
                    "<span foreground='${custom.primary_accent}'>▃</span>" 
                    "<span foreground='${custom.primary_accent}'>▄</span>" 
                    "<span foreground='${custom.secondary_accent}'>▅</span>" 
                    "<span foreground='${custom.secondary_accent}'>▆</span>" 
                    "<span foreground='${custom.secondary_accent}'>▇</span>" 
                    "<span foreground='${custom.secondary_accent}'>█</span>" 
                ];
            };

            # workspace display
            "hyprland/workspaces" = {
                "on-click" = "activate";
                "active-only" = false;
                "all-outputs" = true;
                format = "{}";
                "format-icons" = {
                    urgent = "";
                    active = "";
                    default = "";
                };
            };

            # cpu percentage - hardware group
            cpu = {
                format = "  {usage}%";
                "on-click" = "alacritty -e htop";
            };

            # cpu temperature - hardware group
            temperature = {
                "critical-threshold" = 80;
                format = " {temperatureC}°C ";
            };

            # ram usage - hardware group
            memory = {
                format = "/   {}% ";
                "on-click" = "alacritty -e htop";
            };

            # disk usage - hardware group
            disk = {
                interval = 30;
                format = "/   {percentage_used}% ";
                path = "/";
                "on-click" = "alacritty -e htop";
            };

            # hardware group
            "group/hardware" = {
                orientation = "inherit";
                modules = [
                    "cpu"
                    "temperature"
                    "memory"
                    "disk"
                ];
                drawer = {};
            };

            # wifi/ethernet module
            network = {
                format = "{ifname}";
                "format-wifi" = "   {signalStrength}%";
                "format-ethernet" = "  ";
                "format-disconnected" = "   X";
                "tooltip-format" = " {ifname} via {gwaddri}";
                "tooltip-format-wifi" = " {ifname} @ {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%\nFreq: {frequency}MHz\nUp: {bandwidthUpBits} Down: {bandwidthDownBits}";
                "tooltip-format-ethernet" = " {ifname}\nIP: {ipaddr}\n up: {bandwidthUpBits} down: {bandwidthDownBits}";
                "tooltip-format-disconnected" = "Disconnected";
                "max-length" = 50;
                "on-click" = "nm-connection-manager";
            };

            # bluetooth module
            bluetooth = {
                format = "  {num_connections}";
                "format-disabled" = " ";
                "format-off" = " Off";
                interval = 5;
                "on-click" = "blueman-manager";
                "format-no-controller" = "";
            };

            # battery module
            battery = {
                bat = "BAT0";
                interval = 60;
                states = {
                    warning = 30;
                    critical = 10;
                };
                format = "{capacity}% {icon}";
                "format-icons" = [
                    ""
                    ""
                    "" 
                    ""
                    ""
                ];
                "max-length" = 25;
            };

            # tray module
            tray = {
                spacing = 10;
            };

            # clock module
            clock = {
                format-alt = "{:%Y-%m-%d}";
            };
        }];
    };
}
