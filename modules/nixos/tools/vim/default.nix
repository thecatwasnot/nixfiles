{
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.tools.vim;
in
{
  options.${namespace}.tools.vim = {
    enable = mkBoolOpt false "Weather to install vim.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ vim ];
  };
}
