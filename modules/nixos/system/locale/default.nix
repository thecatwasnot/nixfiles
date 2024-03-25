{
  config,
  lib,
  ...
}:
with lib; {
  options.stardust.system.locale = {
    enable = mkOption {
      default = false;
      type = with types; bool;
      description = "Weather or not to mange locale settings.";
    };
  };
config = let
  inherit (config.stardust.system.locale) enable;
in mkMerge [
  (mkIf enable {
    i18n.defaultLocale = "en_US.UTF-8";
    console = { keyMap = mkForce "us"; };
  })
];
}

