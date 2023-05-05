{ pkgs, config, ... }:
let inherit (config.colorscheme) colors;
in {
  home.packages = [pkgs.anyrun];

  xdg.configFile."anyrun/config.ron".text = ''
    Config(
      // `width` and `vertical_offset` use an enum for the value it can be either:
      // Absolute(n): The absolute value in pixels
      // Fraction(n): A fraction of the width or height of the full screen (depends on exclusive zones and the settings related to them) window respectively

      // How wide the input box and results are.
      width: Absolute(800),

      // Where Anyrun is located on the screen: Top, Center
      position: Top,

      // How much the runner is shifted vertically
      vertical_offset: Fraction(0.3),

      // Hide match and plugin info icons
      hide_icons: false,

      // ignore exclusive zones, f.e. Waybar
      ignore_exclusive_zones: false,

      // Layer shell layer: Background, Bottom, Top, Overlay
      layer: Overlay,

      // Hide the plugin info panel
      hide_plugin_info: true,

      // Close window when a click outside the main box is received
      close_on_click: false,

      // Limit amount of entries shown in total
      max_entries: None,

      plugins: [
        "${pkgs.anyrun}/lib/libapplications.so",
        "${pkgs.anyrun}/lib/libsymbols.so",
        "${pkgs.anyrun}/lib/libshell.so",
        "${pkgs.anyrun}/lib/libtranslate.so",
      ],
    )
  '';
  xdg.configFile."anyrun/style.css".text = ''
    window {
      background: transparent; /* rgba(0, 0, 0, 0.8);*/
    }

    #match,
    #entry,
    #plugin,
    #main {
      background: transparent;
    }

    #match.activatable {
      padding: 6px;
      border-radius: 12px;
      color: white;
      margin-top: 4px;
    }

    #match.activatable:selected {
      background: #${colors.base0C};
      color: black;
    }

    #match-title {
      color: inherit;
    }

    #entry {
      color: white;
      box-shadow: none;
      border-radius: 12px;
      border: 2px solid #${colors.base0C};
    }

    box#main {
      background: #${colors.base00};
      border-radius: 16px;
      padding: 8px;
    }

    row:first-child {
      margin-top: 6px;
    }
  '';
}
