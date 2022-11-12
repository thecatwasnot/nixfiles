{ pkgs, ... }: {
  imports = [
    ./git.nix
    ./shellcolor.nix
  ];
  home.packages = with pkgs; [
  ];
}
