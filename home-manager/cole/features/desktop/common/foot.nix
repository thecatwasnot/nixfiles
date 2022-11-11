{ pkgs, config, ... }: {
  home.packages = [ pkgs.foot ];
  home.file.".config/food/foot.ini".text = ''
    [main]
    font = ${config.fontProfiles.monospace.family}
  '';
}
