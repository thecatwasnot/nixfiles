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
    ./disk-config.nix
  ];

  ${namespace} = {
    system = {
      boot.efi = enabled;
      locale = enabled;
      time = enabled;
      nix = enabled;
      impermanence = enabled;
    };
    hardware.networking = enabled;
    security.sops = enabled;
    services.openssh = enabled;
    tools = {
      git = enabled;
      vim = {
        enable = true;
        defaultEditor = true;
      };
    };
  };
}
