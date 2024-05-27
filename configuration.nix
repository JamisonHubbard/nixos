{ inputs, config, lib, pkgs, ... }:

let
  username = "jamison";
  city = "Denver";
in {
  imports =
    [ 
      # custom nix modules
      ./system/audio.nix
      ./system/bluetooth.nix
      ./system/hyprland.nix
      ./system/starship.nix
      (import ./system/networking.nix {inherit config pkgs username;})
      (import ./system/users.nix {inherit config pkgs username;})

      # home manager
      inputs.home-manager.nixosModules.home-manager
    ];

  # note: these packages are system-wide, for user packages see home.nix
  environment.systemPackages = with pkgs; [
    # utils
    gcc
    git
    home-manager
    htop
    killall
    lazygit
    memtester
    neofetch
    openssh
    p7zip
    playerctl
    ripgrep
    steam-run
    unzip
    wget
    zip

    # programming
    cargo
    python3
    rustc

    # terminals/editors/filesystem navigators
    alacritty
    dolphin
    vim

    # apps
    firefox
    discord
    spotify

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

    # gaming
    mangohud
    protonup

    # bar
    waybar
    networkmanagerapplet
  ];

  # allow proprietary software
  nixpkgs.config.allowUnfree = true;

  # for sunning non-nix executables
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      
    ];
  };

  # shell aliases
  environment.shellAliases = {
    ll = "ls -l";
    la = "ls -al";
    gs = "git status";
    gb = "git branch";
  };

  # keyboard shortcuts / media controls
  programs.light.enable = true;
  services.actkbd = {
    enable = true;
    bindings = [];
  };
  sound.mediaKeys.enable = true;

  # steam config
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
  };
  programs.gamemode.enable = true;

  # home manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      ${username} = import ./home.nix;
    };
  };

  # time zone
  time.timeZone = "America/${city}";

  # internationalisation properties
  i18n.defaultLocale = "en_US.UTF-8";

  # experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?
}
