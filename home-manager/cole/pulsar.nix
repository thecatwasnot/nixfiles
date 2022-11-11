{ inputs, pkgs, ...}: 
let
  inherit (inputs.nix-colors) colorSchemes;
in {
  imports = [
     inputs.nix-colors.homeManagerModule
    ./features/desktop/hyprland.nix
  ];
  colorScheme = inputs.nix-colors.colorSchemes.nova;
}
