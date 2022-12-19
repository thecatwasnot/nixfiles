{ pkgs, ... }: {

  imports = [
    ./zellij.nix
    ./ruby/hanami.nix
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
