{ inputs, lib, config, pkgs, ...}: {

  imports = [ 
    ./common
    ./common/wayland
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
      xwayland.enable = true;
      xwayland.hidpi = false;
      extraConfig = let inherit (config.colorscheme) colors; in
      (builtins.concatStringsSep "\n" (lib.forEach config.monitors (m: ''
        monitor=${m.name},${toString m.width}x${toString m.height},${toString m.x}x${toString m.y},${if m.enabled then "1" else "0"}
        ${lib.optionalString (m.workspace != null)"workspace=${m.name},${m.workspace}"}
        ${lib.optionalString (m.transform != null)"monitor=${m.name},transform,${m.transform}"}
      ''))) +
      ''
        general {
          main_mod = SUPER
          gaps_in = 5
          gaps_out = 8
          border_size = 1.5
          col.active_border=0xff${colors.base0C}
          col.inactive_border=0xff${colors.base02}
          cursor_inactive_timeout = 4
        }

        decoration {
          active_opacity = 0.9
          inactive_opacity = 0.5
          fullscreen_opacity=1.0
          rounding = 5
        }

        animations {
        }
        dwindle {
          col.group_border_active=0xff${colors.base0B}
          col.group_border=0xff${colors.base04}
          split_width_multiplier=1.35
        }

        # Startup
        exec-once=waybar
        exec-once = ${mako}
        # exec-once = ${swayidle} -w

        # Programs
        bind = SUPER, Return, exec, ${terminal}
        bind = SUPER, b, exec, ${browser}

        # Window manager controls
        bind = SUPERSHIFT, q, killactive
        bind = SUPERSHIFT, e, exit

        bind=SUPER,s,togglesplit
        bind=SUPER,f,fullscreen,1
        bind=SUPERSHIFT,f,fullscreen,0
        bind=SUPERSHIFT,space,togglefloating
        bind=SUPER,minus,splitratio,-0.25
        bind=SUPERSHIFT,minus,splitratio,-0.3333333
        bind=SUPER,equal,splitratio,0.25
        bind=SUPERSHIFT,equal,splitratio,0.3333333

				# Window groups
        bind=SUPER,g,togglegroup
        bind=SUPER,apostrophe,changegroupactive,f
        bind=SUPERSHIFT,apostrophe,changegroupactive,b

				# Change window in focus
        bind=SUPER,left,movefocus,l
        bind=SUPER,right,movefocus,r
        bind=SUPER,up,movefocus,u
        bind=SUPER,down,movefocus,d
        bind=SUPER,h,movefocus,l
        bind=SUPER,l,movefocus,r
        bind=SUPER,k,movefocus,u
        bind=SUPER,j,movefocus,d

				# Move window 
        bind=SUPERSHIFT,left,movewindow,l
        bind=SUPERSHIFT,right,movewindow,r
        bind=SUPERSHIFT,up,movewindow,u
        bind=SUPERSHIFT,down,movewindow,d
        bind=SUPERSHIFT,h,movewindow,l
        bind=SUPERSHIFT,l,movewindow,r
        bind=SUPERSHIFT,k,movewindow,u
        bind=SUPERSHIFT,j,movewindow,d

				# Change monitor in focus
        bind=SUPERCONTROL,left,focusmonitor,l
        bind=SUPERCONTROL,right,focusmonitor,r
        bind=SUPERCONTROL,up,focusmonitor,u
        bind=SUPERCONTROL,down,focusmonitor,d

        bind=SUPERCONTROL,h,focusmonitor,l
        bind=SUPERCONTROL,l,focusmonitor,r
        bind=SUPERCONTROL,k,focusmonitor,u
        bind=SUPERCONTROL,j,focusmonitor,d

				# Move workspaces to different monitors
        bind=SUPERALT,left,movecurrentworkspacetomonitor,l
        bind=SUPERALT,right,movecurrentworkspacetomonitor,r
        bind=SUPERALT,up,movecurrentworkspacetomonitor,u
        bind=SUPERALT,down,movecurrentworkspacetomonitor,d
        bind=SUPERALT,h,movecurrentworkspacetomonitor,l
        bind=SUPERALT,l,movecurrentworkspacetomonitor,r
        bind=SUPERALT,k,movecurrentworkspacetomonitor,u
        bind=SUPERALT,j,movecurrentworkspacetomonitor,d

				# Toggle scratchpad and send window to scratchpad
        bind=SUPER,u,togglespecialworkspace
        bind=SUPERSHIFT,u,movetoworkspace,special

				# Move window to workspace
        bind=SUPER,1,workspace,01
        bind=SUPER,2,workspace,02
        bind=SUPER,3,workspace,03
        bind=SUPER,4,workspace,04
        bind=SUPER,5,workspace,05
        bind=SUPER,6,workspace,06
        bind=SUPER,7,workspace,07
        bind=SUPER,8,workspace,08
        bind=SUPER,9,workspace,09
        bind=SUPER,0,workspace,10
        bind=SUPER,f1,workspace,11
        bind=SUPER,f2,workspace,12
        bind=SUPER,f3,workspace,13
        bind=SUPER,f4,workspace,14
        bind=SUPER,f5,workspace,15
        bind=SUPER,f6,workspace,16
        bind=SUPER,f7,workspace,17
        bind=SUPER,f8,workspace,18
        bind=SUPER,f9,workspace,19
        bind=SUPER,f10,workspace,20
        bind=SUPER,f11,workspace,21
        bind=SUPER,f12,workspace,22

				# Move window without following
        bind=SUPERSHIFT,1,movetoworkspacesilent,01
        bind=SUPERSHIFT,2,movetoworkspacesilent,02
        bind=SUPERSHIFT,3,movetoworkspacesilent,03
        bind=SUPERSHIFT,4,movetoworkspacesilent,04
        bind=SUPERSHIFT,5,movetoworkspacesilent,05
        bind=SUPERSHIFT,6,movetoworkspacesilent,06
        bind=SUPERSHIFT,7,movetoworkspacesilent,07
        bind=SUPERSHIFT,8,movetoworkspacesilent,08
        bind=SUPERSHIFT,9,movetoworkspacesilent,09
        bind=SUPERSHIFT,0,movetoworkspacesilent,10
        bind=SUPERSHIFT,f1,movetoworkspacesilent,11
        bind=SUPERSHIFT,f2,movetoworkspacesilent,12
        bind=SUPERSHIFT,f3,movetoworkspacesilent,13
        bind=SUPERSHIFT,f4,movetoworkspacesilent,14
        bind=SUPERSHIFT,f5,movetoworkspacesilent,15
        bind=SUPERSHIFT,f6,movetoworkspacesilent,16
        bind=SUPERSHIFT,f7,movetoworkspacesilent,17
        bind=SUPERSHIFT,f8,movetoworkspacesilent,18
        bind=SUPERSHIFT,f9,movetoworkspacesilent,19
        bind=SUPERSHIFT,f10,movetoworkspacesilent,20
        bind=SUPERSHIFT,f11,movetoworkspacesilent,21
        bind=SUPERSHIFT,f12,movetoworkspacesilent,22
      '';
  };
}
