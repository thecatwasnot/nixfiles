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
    user = enabled;
    shells.zsh = enabled;
    security.gpg = {
      enable = true;
      server = true;
    };
    tools.git = enabled;
    tools.ssh = enabled;
  };
}
