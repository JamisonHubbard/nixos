{ config, pkgs, ... }:

{
  imports = [
    ./apps/alacritty.nix
    ./apps/git.nix
  ];

  # user info
  home.username = "jamison";
  home.homeDirectory = "/home/jamison";

  # user packages
  home.packages = [
    # utils
    pkgs.bat
    pkgs.btop

    # terminals/editors
    pkgs.neovim
    pkgs.starship

    # fonts
    pkgs.nerdfonts
  ];

  # env variables
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.stateVersion = "23.11"; # Please read the comment before changing.
}
