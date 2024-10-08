{
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.system.nix;
in
{
  options.${namespace}.system.nix = {
    enable = mkBoolOpt true "Weather or not to manage nix configuration.";
  };

  config = mkIf cfg.enable {
    nix = {
      settings = {
        auto-optimise-store = true;
        experimental-features = "nix-command flakes";
        warn-dirty = false;
      };
      gc = {
        automatic = true;
        dates = "weekly";
      };
    };
  };
}
