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

  user = config.${namespace}.user;
  gpg = config.${namespace}.security.gpg;
in
{
  options.${namespace}.tools.git = with types; {
    enable = mkBoolOpt false "Weather to enable git configuration.";

    userName = mkOpt (nullOr str) user.fullName "The user's name.";
    userEmail = mkOpt (nullOr str) user.email "The user's email to use with git.";
    signingKey = mkOpt str "8ECA55FD05C67FF0" "The key ID to sign git commits with.";
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      inherit (cfg) userName userEmail;
      signing = {
        key = cfg.signingKey;
        signByDefault = mkIf gpg.enable true;
      };
    };
  };
}
