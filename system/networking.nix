{
  username,
  ...
}: {
    networking.networkmanager.enable = true;
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
