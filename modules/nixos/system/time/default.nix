{
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.system.time;
in
{
  options.stardust.system.time = {
    enable = mkBoolOpt false "Weather or not to manage timezone settings";
  };

  config = mkIf cfg.enable {
    time.timeZone = "America/Chicago";
  };
}
