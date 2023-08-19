# docs:
#   - man home-configuration.nix
#   - https://mipmip.github.io/home-manager-option-search/

{ config, pkgs, ... }:

{
  imports = [
    ./fish.nix
    ./git.nix
  ];

  home.username = "nate";
  home.homeDirectory = "/home/nate";

  home.packages = with pkgs; [
    anonymousPro    

    any-nix-shell # use the existing shell with `nix run` and `nix-shell`
    ripgrep
  ];

  programs = {
    bat.enable = true;
    helix.enable = true;
    home-manager.enable = true;
    # ripgrep.enable = true;
  };

  home.file = {
    ".config/alacritty/alacritty.yml".source = dotfiles/dot_config/alacritty/alacritty.yml;
    ".config/fish/functions/fish_prompt.fish".source = dotfiles/dot_config/fish/functions/fish_prompt.fish;
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
