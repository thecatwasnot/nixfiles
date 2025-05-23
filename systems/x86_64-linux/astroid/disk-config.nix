{
  disko.devices = {
    disk = {
      ssd1 = {
        type = "disk";
        device = "/dev/disk/by-id/ata-CT2000BX500SSD1_2450E999826C";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              size = "1M";
              type = "EF02"; # for grub MBR, no UEFI on this system.
            };
            ESP = {
              name = "ESP";
              size = "500M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            crypt = {
              end = "-16G";
              content = {
                type = "luks";
                name = "p1";
                settings = {
                  keyFile = "/dev/disk/by-id/usb-Verbatim_STORE_N_GO_BFA8831CD319CD78-0:0";
                  keyFileSize = 4096;
                };
                extraOpenArgs = [
                  "--allow-discards"
                  "--perf-no_read_workqueue"
                  "--perf-no_write_workqueue"
                ];
                content = {
                  type = "btrfs";
                  extraArgs = [
                    "-L"
                    "nixos"
                    "-f"
                  ];
                  postCreateHook = ''
                    mount -t btrfs /dev/mapper/p1 /mnt
                    btrfs subvolume snapshot -r /mnt/root /mnt/root-blank
                    umount /mnt
                  '';
                  subvolumes = {
                    "/root" = {
                      mountpoint = "/";
                      mountOptions = [
                        "subvol=root"
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                    "/home" = {
                      mountpoint = "/home";
                      mountOptions = [
                        "subvol=home"
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                    "/nix" = {
                      mountpoint = "/nix";
                      mountOptions = [
                        "subvol=nix"
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                    "/persist" = {
                      mountpoint = "/persist";
                      mountOptions = [
                        "subvol=persist"
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                    "/log" = {
                      mountpoint = "/var/log";
                      mountOptions = [
                        "subvol=log"
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                    "/storage" = {
                      mountpoint = "/storage";
                      mountOptions = [
                        "subvol=storage"
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                  };
                };
              };
            };
            encrypted_swap = {
              size = "100%";
              content = {
                type = "swap";
                randomEncryption = true;
              };
            };
          };
        };
      };
    };
  };
  fileSystems."/persist".neededForBoot = true;
  fileSystems."/var/log".neededForBoot = true;
}
