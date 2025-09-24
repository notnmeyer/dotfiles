{
  programs.git = {
    enable = true;
    userName = "Nate Meyer";
    userEmail = "672246+notnmeyer@users.noreply.github.com";
    aliases = {
      co = "checkout";
      cob = "checkout -b";
    };
    includes = [
      {
        condition = "gitdir:~/code/work/";
        path = "~/code/work/.gitconfig-work";
      }
    ];
    extraConfig = {
      apply = {
        whitespace = "fix";
      };
      branch = {
        sort = "-committerdate";
      };
      column = {
        ui = "auto";
      };
      core = {
        whitespace = "trailing-space,space-before-tab";
      };
      diff = {
        algorithm = "histogram";
        colorMoved = "plain";
        mnemonicPrefix = "true";
        renames = "true";
      };
      fetch = {
        prune = "true";
        pruneTags = "true";
        all = "true";
      };
      init = {
        defaultBranch = "main";
      };
      push = {
        autoSetupRemote = "true";
        default = "simple";
        followTags = "true";
      };
      rebase = {
        autoSquash = "true";
        autoStash = "true";
        updateRefs = "true";
      };
      tag = {
        sort = "version:refname";
      };
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
    settings = {
      aliases = {
        co = "pr checkout";
        pv = "pr view";
      };
      git_protocol = "ssh";
      prompt = "enabled";
    };
  };
}
