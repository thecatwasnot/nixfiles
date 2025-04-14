{
  config,
  lib,
  namespace,
  systems,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.tools.ssh;
  
  hostnames = lib.unique ( builtins.attrNames systems );
in
{
  options.${namespace}.tools.ssh = {
    enable = mkBoolOpt false "Enable home-manager ssh control.";
  };

  config = mkIf cfg.enable {
    programs.ssh = {
      enable = true;
      matchBlocks = {
        "${namespace}" = {
          host = lib.concatStringsSep " " ( lib.flatten (map (host: [
             host
           ])
           hostnames));
          remoteForwards = [
            {
              bind.address = ''/%d/.gnupg-sockets/S.gpg-agent'';
              host.address = ''/%d/.gnupg-sockets/S.gpg-agent.extra'';
            }
          ];
        };
      };
    };
  };
}
