{
  config,
  lib,
  namespace,
  pkgs,
  ...
}:
with lib;
with lib.${namespace};
{
  imports = [
    ./hardware-configuration.nix
    ./disk-config.nix
  ];

  ${namespace} = {
    system = {
      boot.efi = enabled;
      locale = enabled;
      time = enabled;
      nix = enabled;
      impermanence = enabled;
    };
    hardware.networking = enabled;
    security.yubikey = enabled;
    security.sops = enabled;
    services.openssh = enabled;
    tools = {
      git = enabled;
      vim = {
        enable = true;
        defaultEditor = true;
      };
    };
  };

  # networking.hostName = "nixos"; # Define your hostname.

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.alice = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  #   packages = with pkgs; [
  #     firefox
  #     tree
  #   ];
  # };

  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  system.stateVersion = "24.11"; # Did you read the comment?

}
