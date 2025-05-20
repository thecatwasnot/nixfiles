{
  config,
  lib,
  namespace,
  osConfig ? { },
  pkgs,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.desktop.sway;
in
{
  options.${namespace}.desktop.sway = {
    enable = mkBoolOpt false "Enable the sway desktop for this user.";
    desktop = mkBoolOpt false "Multiple monitors for sway.";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ 
      swaybg 
      autotiling
      foot
    ];
    wayland.windowManager.sway = {
      enable = true;
      package = pkgs.swayfx;
      # Disable xwayland
      xwayland = false;
      config = {
        modifier = "Mod4";
        gaps = {
          inner = 2;
          outer = 12;
        };
        startup = [
          { command = "foot --server"; }
          { command = "autotiling"; }
        ];
        defaultWorkspace = "workspace number 1";
        keybindings = let
          mod = "Mod4";
          term = "footclient";
        in {
          "${mod}+Return" = "exec ${term}";
          "${mod}+q" = "kill";
          "${mod}+Shift+e" = "swaymsg exit";

          #Change to workspace
          "${mod}+1" = "workspace number 1";
          "${mod}+2" = "workspace number 2";
          "${mod}+3" = "workspace number 3";
          "${mod}+4" = "workspace number 4";
          "${mod}+5" = "workspace number 5";
          "${mod}+6" = "workspace number 6";
          "${mod}+7" = "workspace number 7";
          "${mod}+8" = "workspace number 8";
          "${mod}+9" = "workspace number 9";
          #Move container to workspace
          "${mod}+Shift+1" = "move container to workspace number 1";
          "${mod}+Shift+2" = "move container to workspace number 2";
          "${mod}+Shift+3" = "move container to workspace number 3";
          "${mod}+Shift+4" = "move container to workspace number 4";
          "${mod}+Shift+5" = "move container to workspace number 5";
          "${mod}+Shift+6" = "move container to workspace number 6";
          "${mod}+Shift+7" = "move container to workspace number 7";
          "${mod}+Shift+8" = "move container to workspace number 8";
          "${mod}+Shift+9" = "move container to workspace number 9";
          #Scratchpad
          "${mod}+Shift+minus" = "move scratchpad";
          "${mod}+minus" = "scratchpad show";
        };
      };
      # fix for: https://github.com/nix-community/home-manager/issues/5379
      checkConfig = false;
      extraConfig = ''
        output * bg #000000 solid_color
        shadows enable
        corner_radius 12
        for_window [app_id="foot"] blur enable
        blur_radius 7
        blur_passes 4
      '';
    };
  };
}
