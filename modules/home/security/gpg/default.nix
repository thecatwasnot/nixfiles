{
  config,
  inputs,
  lib,
  namespace,
  options,
  osConfig ? {},
  pkgs,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.security.gpg;
  shells = config.${namespace}.shells;
in
{
  options.${namespace}.security.gpg = {
    enable = mkBoolOpt false "Weather to enable gpg";
  };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      pinentry-curses
    ];

    programs.gpg = {
      enable = true;
      scdaemonSettings = mkIf (osConfig.${namespace}.security.yubikey.enable or false) {
        disable-ccid = true;
      };

      settings = {
        personal-cipher-preferences = "AES256 AES192 AES";
        personal-digest-preferences = "SHA512 SHA384 SHA256";
        personal-compress-preferences = "ZLIB BZIP2 ZIP Uncompressed";
        default-preference-list = "SHA512 SHA384 SHA256 AES256 AES192 AES ZLIB BZIP2 ZIP Uncompressed";
        cert-digest-algo = "SHA512";
        s2k-digest-algo = "SHA512";
        s2k-cipher-algo = "AES256";
        charset = "utf-8";
        fixed-list-mode = true;
        no-comments = true;
        no-emit-version = true;
        keyid-format = "0xlong";
        list-options = "show-uid-validity";
        verify-options = "show-uid-validity";
        with-fingerprint = true;
        require-secmem = true;
        require-cross-certification = true;
        no-symkey-cache = true;
        use-agent = true;
        throw-keyids = true;
      };
    };
    
    services.gpg-agent = { 
      enable = true;

      defaultCacheTtl = 60;
      maxCacheTtl = 120;
      pinentryPackage = pkgs.pinentry-curses;
      enableSshSupport = true;
      sshKeys = [ "28B380DAD59610FF6BDFB85825670A56DF230988" ];
      enableZshIntegration = mkIf (shells.zsh.enable or true);
      extraConfig = ''
        ttyname $GPG_TTY
      '';
    };
    services.ssh.startAgent = false;

  };
}
