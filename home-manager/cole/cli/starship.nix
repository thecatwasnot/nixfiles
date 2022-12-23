{ pkgs, ... }: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  home.packages = [ pkgs.noto-fonts-emoji-blob-bin ];
}
