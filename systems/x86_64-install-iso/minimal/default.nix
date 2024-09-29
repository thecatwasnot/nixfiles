{
  config,
  lib,
  ...
}:
with lib.stardust;
{
  stardust = {
    nix = enabled;
    system = {
      locale = enabled;
      time = enabled;
    };
  };
}
