{
  config,
  lib,
  ...
}:

{
  stardust = {
    system = {
      locale.enable = true;
    };
  };
  system.stateVersion = "23.11";
}
