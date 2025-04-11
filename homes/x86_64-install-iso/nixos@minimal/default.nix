{
  lib,
  namespace,
  osConfig ? { },
  pkgs,
  ...
}:
with lib.${namespace};
{
  ## TODO: Uncomment when https://github.com/snowfall/lib/pull/147 lands in main
  #${namespace} = {
  stardust = {
    user = {
      enable = true;
      name = "nixos";
      home = "/home/nixos";
    };
    shells.zsh = enabled;
    security.gpg = enabled;
    tools.git = {
      enable = true;
      userName = "Cole Teeter";
      userEmail = "cole.teeter@gmail.com";
    };
    tools.ssh = enabled;
  };
}
