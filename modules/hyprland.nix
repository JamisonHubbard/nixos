{
  config,
  pkgs, 
  ...
}: {
  imports = [];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # tell electron apps to use wayland
  };

  hardware = {
    opengl.enable = true;
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
