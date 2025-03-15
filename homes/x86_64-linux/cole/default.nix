{
  lib,
  namespace,
  osConfig ? {},
  pkgs,
  ...
}:
with lib.${namespace};
{
  ## TODO: Uncomment when https://github.com/snowfall/lib/pull/147 lands in main
  #${namespace} = {
  stardust = {
    user = enabled;
    security.gpg = enabled;
    tools.git = enabled;
  };
}
