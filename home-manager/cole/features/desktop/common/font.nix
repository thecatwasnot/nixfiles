{ pkgs, ...}: {
  fontProfiles = {
    enable = true;
    monospace = {
      family = "Noto Sans Mono";
      package = pkgs.nerdfonts.override { fonts = [ "Noto" ]; };
    };
    regular = {
      family = "Noto Sans";
      package = pkgs.noto-fonts;
    };
  };
}
