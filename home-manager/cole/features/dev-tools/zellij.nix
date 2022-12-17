{ pkgs, config, ... }:
let inherit (config.colorscheme) slug colors;
in {
  home.packages = with pkgs; [
    zellij
  ];
  xdg.configFile."zellij/config.kdl".text = ''
    theme "${slug}"
  '';
  xdg.configFile."zellij/themes/${slug}.kdl".text = ''
    themes {
      ${slug} {
        fg "#${colors.base05}"
        bg "#${colors.base00}"
        black "#${colors.base03}"
        red "#${colors.base08}"
        green "#${colors.base0B}"
        yellow "#${colors.base0A}"
        blue "#${colors.base0D}"
        magenta "#${colors.base0E}"
        cyan "#${colors.base0C}"
        white "#${colors.base05}"
        orange "#${colors.base0F}"
      }
    }
  '';
}
