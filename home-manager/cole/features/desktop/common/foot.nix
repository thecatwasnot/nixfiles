{ pkgs, config, ... }: {
  home.packages = [ pkgs.foot ];
  xdg.configFile."foot/foot.ini".text = ''
    [main]
    font = ${config.fontProfiles.monospace.family}:size=8
    pad = 5x5center
  '';
}
