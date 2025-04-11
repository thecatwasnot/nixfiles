{
  config,
  lib,
  namespace,
  ...
}:
with lib.${namespace};
{
  ${namespace} = {
    system = {
      nix = enabled;
      locale = enabled;
      time = enabled;
    };
    security = {
      yubikey = enabled;
      sops.tools = enabled;
    };
    user = {
      name = "nixos";
      initialPassword = "1";
    };
  };
}
