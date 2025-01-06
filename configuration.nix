{
    inputs,
    system,
    pkgs,
    ...
}:
let
    username = "jamison";
    city = "Denver";
    theme = "blue_green_astronaut";
in {
    imports = [ 
        ./system/audio.nix
        ./system/bluetooth.nix
        ./system/hyprland.nix
        ./system/vpn.nix
        (import ./system/networking.nix {inherit username;})
        (import ./system/starship.nix {inherit theme;})
        (import ./system/users.nix {inherit username;})

        # home manager
        inputs.home-manager.nixosModules.home-manager
    ];

    environment.systemPackages = with pkgs; [
        # system utils
        blueman
        ffmpeg
        ffmpegthumbnailer
        gcc
        home-manager
        htop
        killall
        ntfs3g
        openssh
        ripgrep
        unzip
        wget
        zip
        # memtester
        # p7zip
        # unrar

        # development
        git
        lazygit

        # terminal
        cava
        feh
        kitty
        neofetch
        ranger
        vim

        # neovim plugins
        markdown-oxide

        # apps
        google-chrome
        discord
        obsidian
        spotify
        vlc

        # app launcher
        rofi-wayland

        # wallpaper
        swww

        # notifications
        dunst
        libnotify

        # audio
        pavucontrol

        # gaming
        ckan
        mangohud
        protonup
        steam-run

        # bar
        networkmanagerapplet
        playerctl
        waybar
    ];

    # allow proprietary software
    nixpkgs.config.allowUnfree = true;

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
        extraSpecialArgs = {
            inherit inputs;
            inherit theme;
            inherit system;
        };
        users = {
            ${username} = import ./home.nix;
        };
    };

    programs.firefox = {
        enable = true;
        policies = {
            DisableFirefoxStudies = true;
            EnableTrackingProtection = {
                Value = true;
                Locked = true;
                Cryptomining = true;
                Fingerprinting = true;
            };
            DisablePocket = true;
            DisableFirefoxAccounts = true;
            DisableAccounts = true;
            DisableFirefoxScreenshots = true;
            OverrideFirstRunPage = "";
            OverridePostUpdatePage = "";
            DontCheckDefaultBrowser = true;
            DisplayBookmarksToolbar = "always";
            DisplayMenuBar = "default-off";
            SearchBar = "unified";
        };
    };

    # virtualisation
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;

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
