{
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.user;
in
{
  options.${namespace}.user = with types; {
    enable = mkBoolOpt false "Weather to configure user account.";
    name = mkOpt (nullOr str) config.snowfallorg.user.name "The user account";
    home = mkOpt (nullOr str) config.snowfallorg.user.home.directory "The user's home directory.";

    fullName = mkOpt str "Cole Teeter" "The user's full name.";
    email = mkOpt str "cole.teeter@gmail.com" "The user's email address";
  };

  config = mkIf cfg.enable (mkMerge [
    {
      assertions = [
        {
          assertion = cfg.name != null;
          message = "stardust.user.name must be set.";
        }
        {
          assertion = cfg.home != null;
          message = "stardust.user.home must be set.";
        }
      ];

      home = {
        username = mkDefault cfg.name;
        homeDirectory = mkDefault cfg.home;
      };
    }
  ]);
}
