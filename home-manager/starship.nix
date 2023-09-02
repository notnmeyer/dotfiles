{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    # enableNushellIntegration = true;

    # Configuration written to ~/.config/starship.toml
    settings = {
      # add_newline = false;

      # character = {
      #   success_symbol = "[➜](bold green)";
      #   error_symbol = "[➜](bold red)";
      # };

      # package.disabled = true;
      aws = {
        # format = "on [$symbol($profile )(\($region\) )]($style)";
        # style = "bold blue";
        # symbol = "🅰 ";
      };

      gcloud = {
        disabled = true;
      };
    };
  };
}

