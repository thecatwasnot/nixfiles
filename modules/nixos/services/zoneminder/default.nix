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
  options.${namespace}.services.zoneminder = {
    enable = mkBoolOpt false "Enable zoneminder server.";
    storageDir = mkOpt (types.nullOr types.str) "/storage/zm" "Location to store files.";
    cameras = mkOpt types.int 5 "Number of cameras to support.";
  };

  config = mkIf cfg.enable {
    services.zoneminder = {
      enable = true;
      openFirewall = true;
      database.createLocally = true;
      database.username = "zoneminder";
      inherit (cfg) storageDir cameras;
    };
    systemd.tmpfiles.rules = [
      "d ${cfg.storageDir} 0770 zoneminder nginx -"
      "d /persist/var/lib/zoneminder/events 0770 zoneminder nginx -"
    ];
    environment.persist.directories = [
      "/var/lib/zoneminder"
      "/var/lib/mysql"
    ];
  };
}
