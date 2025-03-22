{
  config,
  lib,
  namespace,
  pkgs,
  options,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.services.display.tuigreet;
in
{
  options.${namespace}.services.display.tuigreet = {
    enable = mkBoolOpt false "Enable tuigreet greeter.";
  };

  config = mkIf cfg.enable {
    services.greetd = {
      enable = true;
      settings = {
        default_session.command = ''
          ${pkgs.greetd.tuigreet}/bin/tuigreet \
            --time \
            --asterisks \
            --user-menu \
            --cmd sway
        '';
      };
    };
    environment.etc."greetd/environments".text = ''
      sway
    '';
  };
}
