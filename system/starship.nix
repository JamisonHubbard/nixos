{
    theme,
    ...
}:
let
    colors = import ../themes/${theme}/colors.nix;
in {
    programs.starship = {
        enable = true;
        settings = {
            format = "$username$git_branch$git_metrics$directory$character";
            add_newline = false;

            username = {
                show_always = true;
                style_user = "bold #${colors.primary_accent}";
                format = "[$user]($style) ";
            };

            git_branch = {
                format = "[$branch(:$remote_branch)]($style) ";
                style = "bold #${colors.tertiary_accent}";
            };

            git_metrics = {
                disabled = false;
                format = "[+$added]($added_style)/[-$deleted]($deleted_style) ";
                added_style = "bold #${colors.green}";
                deleted_style = "bold #${colors.red_light}";
                only_nonzero_diffs = false;
            };

            directory = {
                format = "[$path]($style)[$read_only]($read_only_style) ";
                style = "bold #${colors.secondary_accent}";
            };
        };
    };
}
