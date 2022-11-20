{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true; # Needs config in nixos: environment.pathsToLink = [ "/share/zsh" ];
    enableSyntaxHighlighting = true;
    autocd = true;
    defaultKeymap = "viins";
    plugins = [
      {
#TODO: Fix zompile writing to unwritable directory.
        name = "apollo-zsh-theme";
        file = "apollo-zsh-theme.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "mjrafferty";
          repo = "apollo-zsh-theme";
          rev = "master";
          sha256 = "sha256-9Gz2bMmG2XLZhnIaGSMGHjipqi/aSQaEgVGGoML9Uo8=";
        };
      }
    ];
  };
}
