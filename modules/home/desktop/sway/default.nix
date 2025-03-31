{
  config,
  lib,
  namespace,
  osConfig ? { },
  pkgs,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.desktop.sway;
in
{
  options.${namespace}.desktop.sway = {
    enable = mkBoolOpt false "Enable the sway desktop for this user.";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.swaybg ];
    wayland.windowManager.sway = {
      enable = true;
      package = pkgs.swayfx;
      # Disable xwayland
      xwayland = false;
      config.bars = [ ];
      # fix for: https://github.com/nix-community/home-manager/issues/5379
      checkConfig = false;
      extraConfig = ''
        output * bg #000000 solid_color
      '';
    };
  };
}
