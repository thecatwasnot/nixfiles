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
    # Enable zsh default shell so nix works correctly
    programs.zsh = enabled;
    # Let zsh autocomplete have system packages
    environment.pathsToLink = [ "/share/zsh" ];
    # Allow users to maintain userid through reboots with impermanence
    environment.persist.directories = [ "/var/lib/nixos" ];

    # Configure home-manager
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
    };
  };
}
