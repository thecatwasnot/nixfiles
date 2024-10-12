{
  inputs,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace};
{
  imports = [
    ./disks.nix
  ];

  ${namespace} = {
    system = {
      boot.efi = enabled;
      locale = enabled;
      time = enabled;
      nix = enabled;
      impermanence = enabled;
    };

    #hardware
    hardware = {
      disko = {
        enable = true;
      };
      networking = {
        enable = true;
        wireless = true;
      };
    };

    services.openssh = enabled;
    tools.git = enabled;
    tools.vim = enabled;
    security.sops = enabled;
  };
}
