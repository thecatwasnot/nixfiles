{ pkgs, ... }:
{
  services.printing.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
  services.avahi.openFirewall = true;

  services.printing.drivers = [ pkgs.gutenprint pkgs.hplip pkgs.brlaser ];
}
