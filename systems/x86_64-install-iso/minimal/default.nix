{
  config,
  lib,
  ...
}:
with lib.stardust;
{
  stardust = {
    system = {
      locale = enabled;
      time = enabled;
    };
  };
}
