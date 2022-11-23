{ inputs, pkgs, ...}: 
let
  inherit (inputs.nix-colors) colorSchemes;
in {
  imports = [
     inputs.nix-colors.homeManagerModule
    ./features/desktop/hyprland.nix
    ./features/desktop/optional/zoom.nix
  ];
  colorscheme = inputs.nix-colors.colorSchemes.material-darker;
# Expected layout:
# ----
#|   |
#|   |--------------
#|   ||     ||     |
#|   ||     ||     |
# ------------------
# HDMI-A-1  DVI-D-1  DVI-I-1
  monitors = [
    {
      name = "HDMI-A-1";
      isSecondary = true;
      transform = "3";
# See https://wiki.hyprland.org/Configuring/Monitors/#rotating-and-the-default-workspace
      width = 2560;
      height = 1080;
      x = 0;
      y = 0;
      enabled = true;
    }
    {
      name = "DVI-D-1";
      width = 1920;
      height = 1080;
      x = 1080;
      y = 1480;
      enabled = true;
    }
    {
      name = "DVI-I-1";
      isSecondary = true;
      width = 1920;
      height = 1080;
      x = 3000;
      y = 1480;
      enabled = true;
    }
  ];
}
