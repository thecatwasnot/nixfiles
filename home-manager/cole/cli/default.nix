{ pkgs, ... }: {
  imports = [
    ./git.nix
    ./shellcolor.nix
    ./nvim.nix
    ./zsh.nix
  ];
  home.packages = with pkgs; [
    any-nix-shell
    fd
    ripgrep
  ];
}
