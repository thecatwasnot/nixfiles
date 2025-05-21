{
  config,
  inputs,
  lib,
  namespace,
  pkgs,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.services.display.stylix;
in
{
  options.${namespace}.services.display.stylix = {
    enable = mkBoolOpt false "Enable stylix theming.";
    opacity = mkOpt types.float 0.8 "Default opacity for transparent windows.";
    fontSize = mkOpt types.int 11 "Default font size.";
  };
  
  config = mkIf cfg.enable {
    stylix = {
      enable = true;
      image = config.lib.stylix.pixel "base0A";
      base16Scheme = "${pkgs.base16-schemes}/share/themes/material.yaml";
      polarity = "dark";

      opacity = {
        terminal = cfg.opacity;
        popups = cfg.opacity;
      };

      fonts.sizes = {
        applications = cfg.fontSize;
        desktop = cfg.fontSize;
        popups = cfg.fontSize;
      };
    };
  };
}
