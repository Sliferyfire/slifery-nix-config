{ config, pkgs, ... }:

let
  astronautTheme = pkgs.sddm-astronaut.override {
    embeddedTheme = "hyprland_kath";
  };
in
{
  services = {
    xserver.enable = true;

    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;

        theme = "${astronautTheme}/share/sddm/themes/sddm-astronaut-theme";

        extraPackages = with pkgs; [
          astronautTheme
          kdePackages.qtsvg
          kdePackages.qtmultimedia
          kdePackages.qtvirtualkeyboard
        ];
      };
    };
  };
}
