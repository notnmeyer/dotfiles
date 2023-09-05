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

      container.disabled = true;
      gcloud.disabled = true;
    };
  };
}

