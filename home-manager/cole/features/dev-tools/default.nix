{ pkgs, inputs, ... }: 
let
  devenv = inputs.devenv.packages.${pkgs.system}.devenv;
in
{

  imports = [
    ./zellij.nix
    ./ruby/hanami.nix
  ];

  home.packages = [
    devenv
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.lazygit.enable = true;

  programs.bat.enable = true;
  xdg.configFile."bat/config".text = ''
    --theme="base16"
  '';
}
