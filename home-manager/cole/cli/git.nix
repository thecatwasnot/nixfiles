{ inputs, config, ... }: {

  programs.git = {
    enable = true;
    userName = "Cole Teeter";
    userEmail = "cole.teeter@gmail.com";
    aliases = {
      alias = "! git config --get-regexp ^alias\\. | sed -e s/^alias\\.// -e s/\\ /\\ =\\ /";
      s = "status -s";
      ls = "log --pretty=format:'%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]' --decorate";
      ll = "!git ls --numstat";
      lt = "!git ls --graph";
      ld = "log --pretty=format: '%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]' --date=relative --decorate";
      fixup = ''
      ! sh -c 'SHA =$git rev-parse $1) \
       && git commit --fixup $SHA \
       && git rebase -i --autosquash $SHA~ '-
       '';
    };
    extraConfig = {
      core.editor = "vim";
      color.ui = "auto";
      pull.rebase = "false";
      push.default = "simple";
      push.followTags = "true";
      init.defaultBranch = "main";
      commit.template = "${config.xdg.configHome}/git/committemplate";
    };
  };
  xdg.configFile."git/committemplate".text = ''
# Imperative subject, "If applied, this commit will ..."

# Why is this change necessary?

# How does it address the issue?

# What side effects does this change have?

# Refrences

  '';
}
