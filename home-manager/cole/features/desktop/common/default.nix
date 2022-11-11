{ pkgs, lib, outputs, ... }: {

  imports = [
    ./firefox.nix
    ./font.nix
    ./foot.nix
    ./gtk.nix
  ];
}
