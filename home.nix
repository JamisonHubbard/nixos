{
    pkgs,
    theme,
    ...
}: {
    imports = [
        ./home/bash.nix
        ./home/git.nix
        ./home/hyprland
        ./home/neovim.nix
        ./home/ranger
        (import ./home/kitty.nix {inherit theme;})
        (import ./home/waybar {inherit theme;})
    ];

    # user info
    home.username = "jamison";
    home.homeDirectory = "/home/jamison";

    # create theme symlink
    home.file = {
        "/home/jamison/nixos/themes/current".source = ./themes/${theme};
    };

    # user packages
    home.packages = [
        # utils
        pkgs.bat
        pkgs.btop

        # terminals/editors
        pkgs.starship

        # fonts
        pkgs.nerdfonts
    ];

    # env variables
    home.sessionVariables = {
        EDITOR = "nvim";
        STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/jamison/.steam/root/compatibilitytools.d";
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    home.stateVersion = "23.11"; # Please read the comment before changing.
}
