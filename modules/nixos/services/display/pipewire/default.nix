{
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.services.display.pipewire;
in
{
  options.${namespace}.services.display.pipewire = {
    enable = mkBoolOpt false "Enable pipewire for audio.";
  };

  config = mkIf cfg.enable {
    security.rtkit = enabled;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
