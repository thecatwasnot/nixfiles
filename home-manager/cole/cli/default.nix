{ pkgs, ... }: {
  imports = [
    ./git.nix
    ./shellcolor.nix
    ./starship.nix
    ./nvim.nix
    ./zsh.nix
  ];
  home.packages = with pkgs; [
    any-nix-shell
    fd
    ripgrep
    tree
    exa
  ];
  programs.zsh.initExtra = ''
    any-nix-shell zsh --info-right | source /dev/stdin
  '';
  home.shellAliases = {
    ls = "exa";
    ll = "exa -l";
    la = "exa -la";
    lsg = "exa -l --git --header";
    lt = "exa --tree --long --header";
  };
}
