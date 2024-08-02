{
  inputs,
  pkgs,
  ...
}: {
    programs.hyprland = {
        enable = true;
        package = inputs.hyprland.packages."${pkgs.system}".hyprland;
        xwayland.enable = true;
    };

    environment.sessionVariables = {
        # tell electron apps to use wayland
        NIXOS_OZONE_WL = "1";
    };

    # opengl
    hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
