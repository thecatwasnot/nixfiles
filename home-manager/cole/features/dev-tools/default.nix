{ pkgs, ... }: {
  home.packages = with pkgs; [
    hanami
    zellij
  ];
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  programs.lazygit.enable = true;

  programs.bat.enable = true;
}
