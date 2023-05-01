{ pkgs, inputs, config, ... }:
let
  inherit (inputs.nix-colors.lib-contrib { inherit pkgs; }) shellThemeFromScheme;
in
rec {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true; # Needs config in nixos: environment.pathsToLink = [ "/share/zsh" ];
    enableSyntaxHighlighting = true;
    autocd = true;
    defaultKeymap = "viins";
    plugins = [
    ];
    initExtraFirst = ''
      sh ${shellThemeFromScheme { scheme = config.colorscheme; }}
    '';
  };

  # enable nix-index, a file database for nixpkgs.
  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
  };
}
