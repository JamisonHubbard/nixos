### This file is distinct from modules/hyprland.nix
### that file contains the configuration NixOS needs to setup
### and run Hyprland, whereas this file uses home-manager to 
### create Hyprland's own hyprland.conf dynamically
{ ... }: {
    wayland.windowManager.hyprland = {
        enable = true;
        settings = {
            # monitors
            # see https://wiki.hyprland.org/Configuring/Monitors/
            monitor = [
                ",preferred,auto,auto"
                "Unknown-1,disable"
            ];

            # startup (custom)
            "exec-once" = [
                "swww init"
                "swww img /home/jamison/nixos/wallpapers/current"
                "nm-applet --indicator"
                "dunst"
                "/home/jamison/nixos/home/waybar/start.sh"
            ];

            # my programs
            # see https://wiki.hyprland.org/Configuring/Keywords/
            "$terminal" = "kitty";
            "$fileManager" = "kitty ranger";
            "$menu" = "rofi -show drun -show-icons -theme material";
            "$bar" = "/home/jamison/nixos/home/hyprland/reload.sh";
            "$killbar" = "killall .waybar-wrapped";

            # environment variables
            # see https://wiki.hypland.org/Configuring/Environment-variables/
            env = [
                "XCURSOR_SIZE,24"
                "HYPRCURSOR_SIZE,24"
            ];

            # look and feel
            # see https://wiki.hypland.org/Configuring/Variables/
            general = {
                gaps_in = 5;
                gaps_out = 20;

                border_size = 3;

                "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
                "col.inactive_border" = "rgba(595959aa)";

                resize_on_border = false;

                allow_tearing = false;

                layout = "dwindle";
            };

            # see https://wiki.hypland.org/Configuring/Variables/#decoration
            decoration = {
                rounding = 10;

                # change transparency of focused and unfocused windows
                fullscreen_opacity = 1.0;
                active_opacity = 1.0;
                inactive_opacity = 1.0;

                blur = {
                    enabled = true;
                    size = 3;
                    passes = 1;
                    vibrancy = 0.1696;
                };

                shadow = {
                    enabled = true;
                    range = 4;
                    render_power = 3;
                    color = "rgba(1a1a1aee)";
                };
            };

            # see https://wiki.hypland.org/Configuring/Variables/#animations
            animations = {
                enabled = true;

                bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

                animation = [
                    "windows, 1, 7, myBezier"
                    "windowsOut, 1, 7, default, popin 80%"
                    "border, 1, 10, default"
                    "borderangle, 1, 8, default"
                    "fade, 1, 7, default"
                    "workspaces, 1, 6, default"
                ];
            };

            # see https://wiki.hypland.org/Configuring/Dwindle-Layout/
            dwindle = {
                pseudotile = true;
                preserve_split = true;
            };

            # see https://wiki.hypland.org/Configuring/Master-Layout/
            master = {
              new_status = "master";
            };

            # see https://wiki.hypland.org/Configuring/Variables/#misc
            misc = {
                force_default_wallpaper = -1;
                disable_hyprland_logo = true;
            };

            # input
            # see https://wiki.hypland.org/Configuring/Variables/#misc
            input = {
                kb_layout = "us";
                kb_variant = "";
                kb_model = "";
                kb_options = "";
                kb_rules = "";

                follow_mouse = 1;

                sensitivity = 0;

                touchpad = {
                    natural_scroll = false;
                };
            };

            # see https://wiki.hypland.org/Configuring/Variables/#gestures
            gestures = {
                workspace_swipe = false;
            };

            # see https://wiki.hypland.org/Configuring/Variables/#gestures
            device = {
                name = "epic-mouse-v1";
                sensitivity = -0.5;
            };

            # keybindings
            # see https://wiki.hypland.org/Configuring/Keywords/
            "$mod" = "SUPER";

            bind = [
                "$mod, Q, exec, $terminal"
                "$mod, F, exec, $fileManager"
                "$mod, D, exec, $menu"
                "$mod, R, exec, $bar"
                "$mod, B, exec, $killbar"
                "$mod, C, killactive,"
                "$mod, M, exit,"
                "$mod, V, togglefloating,"
                "$mod, P, pseudo,"
                "$mod, J, togglesplit,"

                # move focus with $mod + arrow keys
                "$mod, left, movefocus, l"
                "$mod, right, movefocus, r"
                "$mod, up, movefocus, u"
                "$mod, down, movefocus, d"

                # switch workspaces with $mod + [0-9]
                "$mod, 1, workspace, 1"
                "$mod, 2, workspace, 2"
                "$mod, 3, workspace, 3"
                "$mod, 4, workspace, 4"
                "$mod, 5, workspace, 5"
                "$mod, 6, workspace, 6"
                "$mod, 7, workspace, 7"
                "$mod, 8, workspace, 8"
                "$mod, 9, workspace, 9"
                "$mod, 0, workspace, 10"

                # move active window to workspace with $mod + shift + [0-9]
                "$mod SHIFT, 1, movetoworkspace, 1"
                "$mod SHIFT, 2, movetoworkspace, 2"
                "$mod SHIFT, 3, movetoworkspace, 3"
                "$mod SHIFT, 4, movetoworkspace, 4"
                "$mod SHIFT, 5, movetoworkspace, 5"
                "$mod SHIFT, 6, movetoworkspace, 6"
                "$mod SHIFT, 7, movetoworkspace, 7"
                "$mod SHIFT, 8, movetoworkspace, 8"
                "$mod SHIFT, 9, movetoworkspace, 9"
                "$mod SHIFT, 0, movetoworkspace, 10"

                # special workspace (scratchpad)
                "$mod, S, togglespecialworkspace, magic"
                "$mod SHIFT, S, movetoworkspace, special:magic"
            ];

            bindm = [
                # move/resize windows with $mod + mouse buttons and dragging
                "$mod, mouse:272, movewindow"
                "$mod, mouse:273, resizewindow"
            ];

            # windows and workspaces
            # see https://wiki.hyprland.org/Configuring/Window-Rules/
            # see https://wiki.hyprland.org/Configuring/Workspace-Rules/
            windowrulev2 = "suppressevent maximize, class:.*";
        };
    };
}
