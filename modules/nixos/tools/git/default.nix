{
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.tools.git;
in
{
  options.${namespace}.tools.git = {
    enable = mkBoolOpt false "Weather to install git.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ git ];
  };
}
