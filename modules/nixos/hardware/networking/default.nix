{
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.hardware.networking;
in
{
  options.${namespace}.hardware.networking = {
    enable = mkBoolOpt false "Weather or not to manage networking with systemd-networkd";
    wireless = mkBoolOpt false "Weatehr to enable wireless networking.";
  };

  config = mkMerge [
    (mkIf cfg.enable {
      systemd.network.enable = true;
      systemd.network.networks."10-wired" = {
        matchConfig.Name = "en*";
        networkConfig.DHCP = "ipv4";
        networkConfig.IPv6AcceptRA = true;
        dhcpV4Config.useDomains = "yes";
      };
    })
    (mkIf (cfg.enable && cfg.wireless) {
      networking.wireless.enable = true;
      systemd.network.wait-online.anyInterface = true;
      systemd.network.networks."20-wireless" = {
        matchConfig.Name = "wl*";
        networkConfig.DHCP = "yes";
      };
      networking.networkmanager.enable = false;
    })
  ];
}
