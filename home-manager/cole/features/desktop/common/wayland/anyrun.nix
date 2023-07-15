{ inputs, pkgs, config, ... }:
let inherit (config.colorscheme) colors;
in {
  imports = [ inputs.anyrun.homeManagerModules.default ];

  programs.anyrun = {
    enable = true;
    config = {
      plugins = [
        inputs.anyrun.packages.${pkgs.system}.applications
        inputs.anyrun.packages.${pkgs.system}.symbols
        inputs.anyrun.packages.${pkgs.system}.shell
        inputs.anyrun.packages.${pkgs.system}.translate
      ];
      width = { fraction = 0.3; };
      #position = "top";
      #verticalOffset = { fraction = 0.3; };
      hideIcons = false;
      layer = "overlay";
      hidePluginInfo = true;
      closeOnClick = false;
      maxEntries = null;
    };

    extraCss = ''
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
  };
}
