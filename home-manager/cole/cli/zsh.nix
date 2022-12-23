{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true; # Needs config in nixos: environment.pathsToLink = [ "/share/zsh" ];
    enableSyntaxHighlighting = true;
    autocd = true;
    defaultKeymap = "viins";
    plugins = [
    ];
  };
}
