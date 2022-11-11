{ inputs, lib, config, pkgs, ...}: {

  imports = [ 
    ./common
    inputs.hyprland.homeManagerModules.default
  ];
  
  home.packages = with pkgs; [
    mako
    swaybg
    swayidle
    swaylock-effects
  ];

  wayland.windowManager.hyprland = 
    let 
      mako = "${pkgs.mako}/bin/mako";
      swaybg = "${pkgs.swaybg}/bin/swaybg";
      swayidle = "${pkgs.swayidle}/bin/swayidle";
      swaylock = "${pkgs.swaylock-effects}/bin/swaylock";

      terminal = "${pkgs.foot}/bin/foot";
      browser = "${pkgs.firefox}/bin/firefox";
    in
    {
      enable = true;
      xwayland.enable = false;
      xwayland.hidpi = false;
      extraConfig =
      ''
        general {
          main_mod = SUPER
          gaps_in = 5
          gaps_out = 10
          border_size = 2.5
          cursor_inactive_timeout = 4
        }

        decoration {
          active_opacity = 0.9
          inactive_opacity = 0.5
          rounding = 5
        }

        animations {
        }
        dwindle {
        }

        # Startup
        # exec-once=waybar
        exec-once = ${mako}
        # exec-once = ${swayidle} -w

        # Programs
        bind = SUPER, Return, exec, ${terminal}
        bind = SUPER, b, exec, ${browser}

        # Window manager controls
        bind = SUPERSHIFT, q, killactive
        bind = SUPERSHIFT, e, exit
      '';
  };
}
