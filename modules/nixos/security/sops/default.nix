{
  config,
  inputs,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.security.sops;
in
{
  options.${namespace}.security.sops = {
    enable = mkBoolOpt false "Weather to use sops-nix.";
  };

  imports = with inputs; [
    sops-nix.nixosModules.sops
  ];

  config = mkIf cfg.enable {
    sops.defaultSopsFormat = "yaml";
  };
}
