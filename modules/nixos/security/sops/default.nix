{
  config,
  inputs,
  lib,
  namespace,
  pkgs,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.security.sops;
in
{
  options.${namespace}.security.sops = {
    enable = mkBoolOpt false "Weather to use sops-nix.";
  };

  imports = with inputs; [
    sops-nix.nixosModules.sops
  ];

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      sops
      ssh-to-age
    ];
    sops = {
      defaultSopsFormat = "yaml";
      # Use the persisted key, it'll be mounted early
      age.sshKeyPaths = [ "/persist/etc/ssh/ssh_host_ed25519_key" ];
    };
  };
}
