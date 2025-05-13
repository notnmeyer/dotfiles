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

      username = {
        disabled = true;
        format = "[$user]($style)@";
      };

      hostname = {
        ssh_only = false;
        ssh_symbol = "ssh:";
        format = "[$ssh_symbol$hostname]($style) ";
        style = "bold yellow";
      };

      time = {
        disabled = false;
        utc_time_offset = "local"; # "0" for utc
      };

      container.disabled = true;
      gcloud.disabled = true;
      kubernetes.disabled = false;
      jobs.disabled = false;

      # the git integration (and some others) can be slow
      command_timeout = 1000; # ms
    };
  };
}

