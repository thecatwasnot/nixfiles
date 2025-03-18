{
  config,
  lib,
  namespace,
  pkgs,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.tools.vim;
in
{
  options.${namespace}.tools.vim = {
    enable = mkBoolOpt false "Install vim.";
    defaultEditor = mkBoolOpt false "Make vim the default editor.";
  };

  config = mkIf cfg.enable {
    programs.vim = {
      inherit (cfg) enable defaultEditor;
    };
  };
}
