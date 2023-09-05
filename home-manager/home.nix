# docs:
#   - man home-configuration.nix
#   - https://mipmip.github.io/home-manager-option-search/

{ config, pkgs, ... }:

{
  imports = [
    ./fish.nix
    ./git.nix
    ./nushell.nix
    ./starship.nix
  ];

  home.username = "nate";
  # all i care about is if this is macos or linux
  home.homeDirectory = if pkgs.stdenv.isDarwin then "/Users/nate" else "/home/nate";

  home.packages = with pkgs; [
    anonymousPro    
    any-nix-shell # use the existing shell with `nix run` and `nix-shell`
    awscli2
    aws-vault
    fish
    go-task
    htop
    nodePackages.bash-language-server
    shellcheck
    tig
  ];

  programs = {
    bat = {
      enable = true;
      config = {
        theme = "Solarized (dark)";
      };
    };

    helix.enable = true;
    home-manager.enable = true;
    ripgrep.enable = true;

    # necessary for starship to configure them
    bash.enable = true;
    zsh.enable = true;
  };

  home.file = {
    ".config/alacritty/alacritty.yml".source = dotfiles/dot_config/alacritty/alacritty.yml;
    ".config/fish/functions/ak.fish".source = dotfiles/dot_config/fish/functions/ak.fish;
    ".config/helix/config.toml".source = dotfiles/dot_config/helix/config.toml;
    ".config/helix/languages.toml".source = dotfiles/dot_config/helix/languages.toml;
    ".gemrc".source = dotfiles/dot_gemrc;
    ".terraformrc".source = dotfiles/dot_terraformrc;
    ".tmux.conf".source = dotfiles/dot_tmux.conf;
    ".wezterm.lua".source = dotfiles/dot_wezterm.lua;
  };

  home.sessionVariables = {
    AWS_DEFAULT_REGION = "us-east-1";
    AWS_DEFAULT_OUTPUT = "json";
    AWS_VAULT_BACKEND = if pkgs.stdenv.isDarwin then "keychain" else "file";
    EDITOR = "hx";
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.
}
