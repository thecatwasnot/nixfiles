{ inputs, ... }: {

  programs.git = {
    enable = true;
    userName = "Cole Teeter";
    userEmail = "cole.teeter@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
