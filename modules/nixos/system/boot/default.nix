{
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.system.boot;
in
{
  options.${namespace}.system.boot = {
    efi.enable = mkBoolOpt false "Weather to use efi boot.";
    bios.enable = mkBoolOpt false "Use BIOS boot.";
  };

  config = mkMerge [
    (mkIf cfg.efi.enable {
      boot.loader.systemd-boot.enable = true;
      boot.loader.systemd-boot.configurationLimit = 10;
      boot.loader.efi.canTouchEfiVariables = true;

      boot.loader.systemd-boot.editor = false;
    })
    (mkIf cfg.bios.enable {
      boot.loader.grub.enable = true;
      boot.loader.grub.version = 2;
      boot.loader.grub.efiSupport = false;
      # boot.loader.grub.device = "nodev";
    })];
}
