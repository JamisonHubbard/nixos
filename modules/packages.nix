{
  config,
  pkgs,
  ...
}: {
  imports = [];

  environment.systemPackages = with pkgs; [
    # utils
    git
    home-manager
    htop
    openssh
    wget
    zip

    # terminals/editors
    alacritty
    vim

    # fonts
    nerdfonts

    # web
    firefox

    # bluetooth
    blueman

    # app launcher
    rofi-wayland

    # wallpaper
    swww

    # notifications
    dunst
    libnotify # dunst dependency

    # audio
    pavucontrol

    # bar
  ];
}
