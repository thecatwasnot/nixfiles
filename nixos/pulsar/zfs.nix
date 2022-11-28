{ config, pkgs, ... }:

{
  boot.supportedFilesystems = [ "zfs" ];
  networking.hostId = "1461ace6";
  boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.efi.canTouchEfiVariables = false;
  boot.loader.generationsDir.copyKernels = true;
  boot.loader.grub.efiInstallAsRemovable = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.copyKernels = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.zfsSupport = true;
  boot.loader.grub.extraPrepareConfig = ''
    mkdir -p /boot/efis
    for i in  /boot/efis/*; do mount $i ; done

    mkdir -p /boot/efi
    mount /boot/efi
  '';
  boot.loader.grub.extraInstallCommands = ''
    ESP_MIRROR=$(mktemp -d)
    cp -r /boot/efi/EFI $ESP_MIRROR
    for i in /boot/efis/*; do
     cp -r $ESP_MIRROR/EFI $i
    done
    rm -rf $ESP_MIRROR
  '';
  boot.loader.grub.devices = [
    "/dev/disk/by-id/ata-T-FORCE_1TB_112007210450713"
    "/dev/disk/by-id/ata-T-FORCE_1TB_AD0000000000000173"
  ];
  users.users.root.initialHashedPassword = "$6$CAnB2ncXfdYCQWh8$M359CCDzgO7wg.L.yNySCBAlzgxiwNiJQsqU3c9MexY6Oe/iz3ZV7zMNcKDJz68AwuOpuVJqTCH9p5llvfgXU0";
}
