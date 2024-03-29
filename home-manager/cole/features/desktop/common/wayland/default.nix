{ pkgs, ... }: {
  imports = [
    ./swayidle.nix
    ./swaylock.nix
    ./waybar.nix
    ./wlsunset.nix
    ./anyrun.nix
  ];

  home.packages = with pkgs; [
    grim
    imv
    slurp
    wf-recorder
    wl-clipboard
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    QT_QPA_PLATFORM = "wayland";
  };
}
