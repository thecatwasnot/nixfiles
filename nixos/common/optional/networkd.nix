{ ... }: {
  # Disable default, enable networkd & resolved
  networking.useDHCP = false;
  networking.dhcpcd.enable = false;

  networking.useNetworkd = true;
  services.resolved.enable = true;

  systemd.network.enable = true;
  systemd.network.networks."99-main".enable = false;
  systemd.network.networks."20-wired" = {
    name = "en*";
    DHCP = "yes";
    networkConfig = {
      IPv6PrivacyExtensions = "yes";
    };
  };

}
