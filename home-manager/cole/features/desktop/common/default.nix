{ pkgs, lib, outputs, ... }: {

  imports = [
    ./firefox.nix
    ./font.nix
    ./foot.nix
    ./gtk.nix
    ./playerctl.nix
  ];
  home.packages = with pkgs; [
    pavucontrol
  ];
}
