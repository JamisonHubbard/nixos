{
  config,
  pkgs,
  username,
  ...
}: {
  imports = [];

  networking.wireless.enable = false; # disable wpa_supplicant
  networking.networkmanager.enable = true; # enable nmtui
  networking.hostName = "${username}-nixos";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # firewall
  networking.firewall.enable = false;

  # ssh
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
    };
  };
}
