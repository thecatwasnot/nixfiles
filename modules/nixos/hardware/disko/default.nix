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
  cfg = config.${namespace}.hardware.disko;
in
{
  options.${namespace}.hardware.disko = {
    enable = mkBoolOpt false "Weather to use disko for disk formatting & configuration";
  };

}
