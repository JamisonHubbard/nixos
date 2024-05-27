{
  config,
  pkgs,
  ...
}: 
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

      # modules positions
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
        "bluetooth"
        "network"
        "group/hardware"
        "tray"
        "clock"
      ];

      ### modules ###

      # left modules

      user = {
        format = "{user}";
        interval = 60;
        height = 30;
        width = 30;
        icon = true;
      };

      "custom/player" = {
        format = "{}";
        "return-type" = "json";
        exec = "playerctl -a metadata --format '{\"text\": \"{{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
        max-length = 20;
      };

      "custom/playerctl#back" = {
        format = "󰙣 ";
        "on-click" = "playerctl previous";
      };

      "custom/playerctl#play" = {
        format = "{icon}";
        "return-type" = "json";
        exec = "playerctl -a metadata --format '{\"text\": \"{{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
        "on-click" = "playerctl play-pause";
        format-icons = {
          Playing = "<span>󰏥 </span>";
          Paused = "<span> </span>";
          Stopped = "<span> </span>";
        };
      };

      "custom/playerctl#next" = {
        format = "󰙡 ";
        on-click = "playerctl next";
      };

      # center modules

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

      # right modules

      disk = {
        interval = 30;
        format = "/   {percentage_used}% ";
        path = "/";
        "on-click" = "alacritty -e htop";
      };

      cpu = {
        format = "  {usage}%";
        "on-click" = "alacritty -e htop";
      };

      temperature = {
        "critical-threshold" = 80;
        format = " {temperatureC}°C ";
      };

      memory = {
        format = "/   {}% ";
        "on-click" = "alacritty -e htop";
      };

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

      bluetooth = {
        format = "  {num_connections}";
        "format-disabled" = " ";
        "format-off" = " Off";
        interval = 5;
        "on-click" = "blueman-manager";
        "format-no-controller" = "";
      };

      pulseaudio= {
        format = "{icon} {volume}%";
        format-muted = "󰝟";
        format-icons = {
          default = ["󰕿" "󰖀" "󰕾"];
        };
        scroll-step = 5;
        on-click = "pavucontrol";
      }; 

      tray = {
        spacing = 10;
      };

      clock = {
        format-alt = "{:%Y-%m-%d}";
      };
    }];
  };
}
