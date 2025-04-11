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
    enable = mkBoolOpt false "Use sops-nix.";
    tools.enable = mkBoolOpt false "Install sops tools.";
  };

  imports = with inputs; [
    sops-nix.nixosModules.sops
  ];

  config = mkMerge [
    (mkIf (cfg.enable or cfg.tools.enable) {
      environment.systemPackages = with pkgs; [
        sops
        ssh-to-age
      ];
    })
    (mkIf cfg.enable {
      sops = {
        defaultSopsFormat = "yaml";
        # Use the persisted key, it'll be mounted early
        age.sshKeyPaths = [ "/persist/etc/ssh/ssh_host_ed25519_key" ];
      };
    })
  ];
}
