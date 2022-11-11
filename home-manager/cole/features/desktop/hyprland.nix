{ inputs, lib, config, pkgs, ...}: {
  imports = [ inputs.hyprland.homeManagerModules.default ];
  
  home.packages = with pkgs; [
    mako
    swaybg
    swayidle
    swaylock-effects
    foot
    firefox
  ];

  wayland.windowManager.hyprland = 
    let 
      mako = "${pkgs.mako}/bin/mako";
      swaybg = "${pkgs.swaybg}/bin/swaybg";
      swayidle = "${pkgs.swayidle}/bin/swayidle";
      swaylock = "${pkgs.swaylock-effects}/bin/swaylock";

      terminal = "${pkgs.foot}/bin/foot";
      browser = "${pkgs.firefox}/bin/firefox";
    in
    {
      enable = true;
      package = (inputs.hyprland.packages.${pkgs.system}.hyprland.override {legacyRenderer = true;});
      # xwayland.enable = false;
      # xwayland.hidpi = false;
      #extraConfig =
      #''
      #'';
  };
}
