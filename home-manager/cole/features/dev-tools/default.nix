{ pkgs, ... }: {
  imports = [
    ./zellij.nix
  ];

  home.packages = with pkgs; [
    hanami
  ];
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  programs.lazygit.enable = true;

  programs.bat.enable = true;
}
