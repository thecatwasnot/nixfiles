{
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.tools.ssh;
in
{
  options.${namespace}.tools.ssh  = {
    enable = mkBoolOpt false "Enable home-manager ssh control.";
  };

  config = mkIf cfg.enable {
    programs.ssh = {
      enable = true;
    };
  };
}
