{
  config,
  pkgs,
  username,
  ...
}: {
  imports = [];

  users.users.${username} = {
    isNormalUser = true;
    home = "/home/${username}";
    extraGroups = [
      "audio"
      "disk"
      "input"
      "networkmanager"
      "storage"
      "video"
      "wheel"
    ];
  };
}
