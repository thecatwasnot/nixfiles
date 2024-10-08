{
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.system.locale;
in
{
  options.${namespace}.system.locale = {
    enable = mkBoolOpt false "Weather or not to mange locale settings.";
  };

  config = mkIf cfg.enable {
    i18n.defaultLocale = "en_US.UTF-8";
    console = {
      keyMap = mkForce "us";
    };
  };
}
