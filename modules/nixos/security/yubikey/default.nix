{
  config,
  lib,
  namespace,
  options,
  pkgs,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.security.yubikey;
in
{
  options.${namespace}.security.yubikey = {
    enable = mkBoolOpt false "Weather to use pam for u2f configuration.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      cryptsetup
      yubikey-manager
    ];
    security.pam.u2f = {
      enable = true;
      settings = {
        interactive = true;
        cue = true;
        origin = "pam://yubi";
        authFile = pkgs.writeText "u2f-mappings" (lib.concatStrings [
          ":MPzntbNp8dVWi5b3ivtoUKF2T0uQEDybPXQATYQEikciP0mpxRZuXwM0yYeNH/jRLZjnx6J/W13AzUpR65kGog==,i617b+HXSaJLj8clzC+MsZbNcvXxBuMcXjEybOULrrvmhd6W49x6Mq5YL72cIkT6IZgEXFoiTrKMQ5/pStl8Kw==,es256,+presence"
          ":NS1EGiriHR/LJUTrLxUsKkq6bO8k/TRPw/QMlfr6+V8iUFhf0YHwGZpnbUGnHMjOZuCcW+wJGUyFHLVyuuQG7w==,XaSWnGsP7w5MDxcgi7W9QCvYppEHV96QASDlJwU/cRTukZuRruWzO8QTPLPwOWxjrGG1i1co+Ulr9UOixoxGSw==,es256,+presence"
        ]);
      };
    };
    security.pam.services = {
      login.u2fAuth = true;
      sudo.u2fAuth = true;
    };
    services = {
      pcscd.enable = true;
      udev.packages = [ pkgs.yubikey-personalization ];
    };
  };
}
