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
      init = { defaultBranch = "main"; };
      color = { ui = "auto"; };
      "credential \"https://github.com\"" = {
        helper = "!`which gh` auth git-credential"; 
      };
      "credential \"https://gist.github.com\"" = {
        helper = "!`which gh` auth git-credential";
      };
    };
  };
}
