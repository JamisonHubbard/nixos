{
  username,
  ...
}: {
    users.users.${username} = {
        isNormalUser = true;
        home = "/home/${username}";
        extraGroups = [
            "audio"
            "disk"
            "input"
            "libvirtd"
            "networkmanager"
            "storage"
            "video"
            "wheel"
        ];
    };
}
