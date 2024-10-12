{
  disko.devices = {
    disk.main = {
      device = "/dev/sda";
      type = "disk";
      content = {
        type = "gpt";
        partitions = {
          ESP = {
            label = "EFI";
            name = "ESP";
            size = "1024M";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
            };
          };
          swap = {
            label = "swap";
            size = "4G";
            content = {
              type = "swap";
              resumeDevice = true;
            };
          };
          luks = {
            label = "encrypted";
            size = "100%";
            content = {
              type = "btrfs";
              extraArgs = [ "-f" ];
              subvolumes = {
                "/root" = {
                  mountpoint = "/";
                  mountOptions = [
                    "compress=zstd"
                    "noatime"
                  ];
                };
                "/root-blank" = {
                  mountOptions = [
                    "compress=zstd"
                    "noatime"
                  ];
                };
                "/home" = {
                  mountOptions = [
                    "compress=zstd"
                    "noatime"
                  ];
                };
                "/home/active" = {
                  mountpoint = "/home";
                  mountOptions = [
                    "compress=zstd"
                    "noatime"
                  ];
                };
                "/home/snapshots" = {
                  mountpoint = "/home/.snapshots";
                  mountOptions = [
                    "compress=zstd"
                    "noatime"
                  ];
                };
                "/nix" = {
                  mountpoint = "/nix";
                  mountOptions = [
                    "compress=zstd"
                    "noatime"
                  ];
                };
                "/persist" = {
                  mountOptions = [
                    "compress=zstd"
                    "noatime"
                  ];
                };
                "/persist/active" = {
                  mountpoint = "/persist";
                  mountOptions = [
                    "compress=zstd"
                    "noatime"
                  ];
                };
                "/persist/snapshots" = {
                  mountpoint = "/persist/.snapshots";
                  mountOptions = [
                    "compress=zstd"
                    "noatime"
                  ];
                };
                "/var_local" = {
                  mountOptions = [
                    "compress=zstd"
                    "noatime"
                  ];
                };
                "/var_local/active" = {
                  mountpoint = "/var/local";
                  mountOptions = [
                    "compress=zstd"
                    "noatime"
                  ];
                };
                "/var_local/snapshots" = {
                  mountpoint = "/var/local/.snapshots";
                  mountOptions = [
                    "compress=zstd"
                    "noatime"
                  ];
                };
                "/var_log" = {
                  mountpoint = "/var/log";
                  mountOptions = [
                    "compress=zstd"
                    "noatime"
                  ];
                };
              };
            };
          };
        };
      };
    };
  };
}
