{
  config,
  pkgs,
  ...
}: {
  imports = [];

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
}
