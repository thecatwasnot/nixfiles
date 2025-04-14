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
  cfg = config.${namespace}.services.zoneminder;
in
{
  options.${namspace}.services.zoneminder = {
    enable = mkBoolOpt false "Enable zoneminder server.";
    storageDir = mkOpt types.string "/storage/zm" "Location to store files.";
    cameras = mkOpt types.int 5 "Number of cameras to support.";
  };

  config = mkIf cfg.enable {
    services.zoneminder = {
      enable = true;
      database.createLocally = true;
      inherit storageDir cameras
    };
  };
}
