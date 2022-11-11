{ pkgs, inputs, ... }: 
let
  addons = inputs.firefox-addons.packages.${pkgs.system};
in
{
  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      forceWayland = true;
    };
    extensions = with addons; [
      bitwarden
      duckduckgo-privacy-essentials 
      forget_me_not
    ];
    profiles.cole = {
      bookmarks = {};
      settings = {
        "browser.startup.homepage" = "https://start.duckduckgo.com";
        "privacy.trackingprotection.enabled" = true;
        "dom.security.https_only_mode" = true;
        "signon.rememberSignons" = false;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.shell.defaultBrowserCheckCount" = 1;
      };
    };
  };
}
