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

  # enable nix-index, a file database for nixpkgs.
  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
  };
}
