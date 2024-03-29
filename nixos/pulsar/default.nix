# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:
let ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  imports =
    [
      # Include the results of the hardware scan.
      inputs.hardware.nixosModules.common-cpu-amd
      inputs.hardware.nixosModules.common-gpu-amd
      inputs.hardware.nixosModules.common-pc-ssd

      ./hardware-configuration.nix
      ./zfs.nix

      ../common/global/nix.nix
      ../common/global/detect-reboot-needed.nix
      ../common/optional/networkd.nix
      ../common/optional/pipewire.nix
      ../common/optional/virt-manager.nix
      ../common/optional/flatpak.nix
      ../common/optional/printing.nix
    ];


  networking.hostName = "pulsar"; # Define your hostname.
  # Set your time zone.
  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cole = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "video" ] ++ ifTheyExist [ "libvirtd" ];
    initialPassword = "password";
  };

  programs.zsh.enable = true;
  programs.ssh.startAgent = true;
  environment.pathsToLink = [ "/share/zsh" ]; # For programs.zsh.enableCompletion

  security.pam.services = { swaylock = { }; }; # For swaylock

  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "dbus-run-session ${pkgs.cage}/bin/cage -s -- ${pkgs.greetd.regreet}/bin/regreet";
    };
  };
  programs.regreet = {
    enable = true;
  };

  programs.hyprland.enable = true;
  # Configuration for hyprland.  See: https://github.com/hyprwm/Hyprland/blob/main/nix/module.nix

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    pciutils
    libcamera
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };


  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}

