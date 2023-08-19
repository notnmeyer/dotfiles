{
  programs.fish = {
    enable = true;
    functions = {
      k = {
        body = "kubectl $argv";
        wraps = "kubectl";
      };
      scode = {
        body = "code --remote ssh-remote+\"$argv[1]\" \"$argv[2]\"";
        description = "slightly shorten the syntax for launch remote vscode sessions";
      };
    };
    shellAliases = {
      # git
      ga = "git add $argv";
      gap = "git add -p";
      gc = "git commit $argv";
      gd = "git diff $argv";
      gpr = "git pull --rebase";
      gp = "git push origin (git branch --show-current)";
      gs = "git status";
    };
    interactiveShellInit = "any-nix-shell fish --info-right | source";
  };
}
