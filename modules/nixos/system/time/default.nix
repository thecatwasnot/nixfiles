{
  config,
  lib,
  ...
}:
with lib; {
  options.stardust.system.time = {
    enable = mkOption {
      default = false;
      type = with types; bool;
      description = "Weather or not to manage timezone settings";
    };
  };

  config = let
    inherit (config.stardust.system.time) enable;
  in mkMerge [
    (mkIf enable {
      time.timeZone = "America/Chicago";
    })
  ];
}
