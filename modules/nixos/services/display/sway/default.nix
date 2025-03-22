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
    enable = mkBoolOpt false "Enable sway compositor.";
  };

  config = mkIf cfg.enable {
    programs.sway.enable = true;
    security.polkit.enable = true;
    #services.gnome-keyring.enable = true;
    # Enable our local support
    ${namespace}.services.display = {
      pipewire = enabled;
      tuigreet.enable = false;
    };
  };
}
