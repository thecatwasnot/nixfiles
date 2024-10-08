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
  };
}
