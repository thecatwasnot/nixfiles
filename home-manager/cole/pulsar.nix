{ inputs, pkgs, ...}: 
let
  inherit (inputs.nix-colors) colorSchemes;
in {
  imports = [
     inputs.nix-colors.homeManagerModule
    ./features/desktop/hyprland.nix
  ];
  colorscheme = inputs.nix-colors.colorSchemes.material-darker;
}
