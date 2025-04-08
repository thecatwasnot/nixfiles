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
  sops = config.${namespace}.security.sops;
in
{
  options.${namespace}.user = with types; {
    name = mkOpt str "cole" "The name of the user's account";
    initialPassword = mkOpt str "1234" "The initial password to use";
    isAdmin = mkBoolOpt true "Weather the user is an admin.";
  };

  config = {
    users.mutableUsers = false;
    users.users.${cfg.name} = {
      isNormalUser = true;

      # Set user password, we'd prefer the one in sops secrets but fallback to configured password
      hashedPasswordFile = mkIf sops.enable config.sops.secrets."${cfg.name}_passwd".path;
      initialPassword = mkIf (!sops.enable) cfg.initialPassword;

      extraGroups = mkIf cfg.isAdmin [ "wheel" ];
      shell = pkgs.zsh;
      
      openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC4Esc+vHlli7XJoQ/sOxY0LQZNkd1nXBmh5Ak/mRhOfHpLQhDZBalb9bh7JtykQkLyuAgv502czSn4S/39kcztbkTQxs7VYbaQmRpK1TWQC0gw+HZvzp5g4Ns8lZGktcQ3EQwl3EWUM1GtLvJHtlyGxFg/wQaPwgrIwAIwaN9NOFHFvNfX9oxJgtcEDWpdkDmc9eYZLJq8yJM7STTzd1nUQm312EpF/Lbk8vu+rRTICUJup3hDeJ6Rujcl0oJ8TpReZwOYpn2MInrZIJ5I8tWkRCtdD+wWdQwebv7v+CYseIVq2/0+DFqFvhCdVdmSr/rrLgMUmbZNllKV630FbIeqa3qipYjInwn+L8niug+RIzrBdFXDEAFhP74+ofLMS8v2jp3P2c1iuqctr4HDTXqZ+ibxKAjHm1b5JU4JTvlKemNIPwGZGgL5wRx3jrB9bGuxKsUGKwrdJ/q/idbsxQy/rsedKUejOxJFnatlKWZwVhE69nywDN95dSR8Ad0ZpmMe3oa8Pd0wSEpGI2p/T+cOFAKBgXd6OkyMIW9LO+Pu9pEhGU/5n2hAcFS340j1X2i4Ij8SJL4cJmpmEzbYmnKqa9WqrsYMGDpI3u3LFxa/sXMRaGktdbEa3gnVapdBxczcnT3lWMdlWRVDS7V6mhHtIXOgvQ1JlBtnLKd27j1JUQ== openpgp:0xAC6C6FF8"
      ];
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
    sops.secrets."${cfg.name}_passwd" = mkIf sops.enable {
      sopsFile = ../../../systems/secrets.yaml;
      neededForUsers = true;
    };
  };
}
