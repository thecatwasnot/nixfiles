{ pkgs, ... }: {
  imports = [
    ./git.nix
    ./shellcolor.nix
    ./vim.nix
  ];
  home.packages = with pkgs; [
  ];
}
