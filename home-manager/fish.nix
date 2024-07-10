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
      gp = "git push -u origin (git branch --show-current)";
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
          "/opt/homebrew/bin" \
          "/usr/local/bin" \
          "$fish_user_paths"
      end
      any-nix-shell fish --info-right | source;

      # set up macos homebrew, if installed
      if test -f /opt/homebrew/bin/brew >/dev/null
        eval (/opt/homebrew/bin/brew shellenv)
      end

      if which zoxide >/dev/null
        zoxide init fish | source
      end

      if which asdf >/dev/null
        source ~/.nix-profile/share/asdf-vm/asdf.fish
        source ~/.nix-profile/share/asdf-vm/completions/asdf.fish
      end

      if test -f "$HOME/.config/fish/conf.d/secrets.env"
        source "$HOME/.config/fish/conf.d/secrets.env"
      end
    '';
  };
}
