{
  programs.git = {
    enable = true;
    userName = "Nate Meyer";
    userEmail = "672246+notnmeyer@users.noreply.github.com";
    aliases = {
      co = "checkout";
      cob = "checkout -b";
    };
    extraConfig = {
      push = {
        autoSetupRemote = "true";
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
