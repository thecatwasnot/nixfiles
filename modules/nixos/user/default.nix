{
  config,
  lib,
  namespace,
  options,
  pkgs,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.user;
in {
  options.${namespace}.user = with types; {
    name = mkOpt str "cole" "The name of the user's account";
    initialPassword = mkOpt str "1234" "The initial password to use";
    isAdmin = mkBoolOpt true "Weather the user is an admin.";
  };

  config = {
    users.mutableUsers = false;
    users.users.${cfg.name} = {
      isNormalUser = true;
      inherit (cfg) initialPassword;
      extraGroups = mkIf cfg.isAdmin [ "wheel" ];
      shell = pkgs.zsh;
    };
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      histFile = "$XDG_CACHE_HOME/zsh.history";
      shellInit =
        ''
          set -o vi
          # Improved vim bindings.
          source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
        '';
    };
  };
}
