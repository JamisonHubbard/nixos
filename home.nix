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
  ];

  # file management
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # env variables
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.stateVersion = "23.11"; # Please read the comment before changing.
}
