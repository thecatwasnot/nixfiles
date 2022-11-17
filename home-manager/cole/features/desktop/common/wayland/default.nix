{ pkgs, ...}: {
  imports = [
    ./waybar.nix
    ./wlsunset.nix
  ];
  home.packages = with pkgs; [
   grim
   imv
   slurp
   wf-recorder
   wl-clipboard
  ];
}
