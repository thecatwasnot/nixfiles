{
  config,
  lib,
  namespace,
  pkgs,
  ...
}:
with lib;
with lib.${namespace};
{
  imports = [
    ./hardware-configuration.nix
    ./disk-config.nix
  ];

  ${namespace} = {
    system = {
      boot.bios = enabled;
      locale = enabled;
      time = enabled;
      nix = enabled;
      impermanence = enabled;
    };
    hardware.networking = enabled;
    security.sops = enabled;
    services.openssh = enabled;
    services.zoneminder = enabled;
    tools = {
      git = enabled;
      vim = {
        enable = true;
        defaultEditor = true;
      };
    };
  };
  system.stateVersion = "24.11"; # Did you read the comment?
}
