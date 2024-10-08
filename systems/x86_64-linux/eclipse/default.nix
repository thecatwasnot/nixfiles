{
  lib,
  namespace,
  ...
}:
with lib.${namespace};
{
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
        disk = "/dev/sda";
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
