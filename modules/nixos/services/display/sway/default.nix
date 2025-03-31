{
  config,
  lib,
  namespace,
  options,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.services.display.sway;
in
{
  options.${namespace}.services.display.sway = {
    enable = mkBoolOpt false "Enable support for the sway compositor.";
  };

  config = mkIf cfg.enable {
    programs.sway = {
      enable = true;
      package = null;
    };
    #services.gnome-keyring.enable = true;
  };
}
