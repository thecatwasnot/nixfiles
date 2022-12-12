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
    tree
  ];
  programs.zsh.initExtra = ''
    any-nix-shell zsh --info-right | source /dev/stdin
  '';
}
