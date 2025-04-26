{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    # enableNushellIntegration = true;

    # Configuration written to ~/.config/starship.toml
    settings = {
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };

      hostname = {
        ssh_only = false;
        format = "\\([$hostname]($style)\\) ";
        style = "bold yellow";
      };

      container.disabled = true;
      gcloud.disabled = true;
      kubernetes.disabled = false;

      # the git integration (and some others) can be slow
      command_timeout = 1000; # ms
    };
  };
}

