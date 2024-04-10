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
      gg = {
        body = "lazygit \"$argv\"";
        wraps = "lazygit";
      };
    };
    shellAliases = {
      # git
      ga = "git add";
      gap = "git add -p";
      gc = "git commit";
      gd = "git diff";
      gpr = "git pull --rebase";
      gp = "git push origin (git branch --show-current)";
      gs = "git status";
    };

    interactiveShellInit = ''
      begin
        set -g fish_user_paths \
          "$HOME/.cargo/bin" \
          "$HOME/bin" \
          "$HOME/go/bin" \
          "$HOME/.local/bin" \
          "/nix/var/nix/profiles/default/bin/" \
          "$HOME/.nix-profile/bin" \
          "$fish_user_paths"
      end
      any-nix-shell fish --info-right | source;
      eval (/opt/homebrew/bin/brew shellenv)

      if asdf --help >/dev/null
        source "$HOME/.nix-profile/share/asdf-vm/asdf.fish"
        source "$HOME/.nix-profile/share/asdf-vm/completions/asdf.fish"
      end

    '';
  };
}
