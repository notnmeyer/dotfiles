# docs:
#   - man home-configuration.nix
#   - https://mipmip.github.io/home-manager-option-search/

{ config, pkgs, ... }:
let
  commonPackages = import ./common.nix { inherit pkgs; };
in {
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  imports = [
    ./fish.nix
    ./git.nix
    ./neovim.nix
    ./nushell.nix
    ./starship.nix
  ];

  home.username = "nate";
  # all i care about is if this is macos or linux
  home.homeDirectory = if pkgs.stdenv.isDarwin then "/Users/nate" else "/home/nate";

  home.packages = with pkgs; [
    anonymousPro
    any-nix-shell # use the existing shell with `nix run` and `nix-shell`
    bun
    nodejs_22
    yarn-berry
  ] ++ commonPackages;

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

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    # necessary for starship to configure them
    bash.enable = false;
    zsh.enable = false;
  };

  home.file = {
    ".config/alacritty/alacritty.yml".source = dotfiles/dot_config/alacritty/alacritty.yml;
    ".config/zellij/config.kdl".source = dotfiles/dot_config/zellij/config.kdl;
    ".gemrc".source = dotfiles/dot_gemrc;
    ".terraformrc".source = dotfiles/dot_terraformrc;
    ".tmux.conf".source = dotfiles/dot_tmux.conf;
    ".wezterm.lua".source = dotfiles/dot_wezterm.lua;

    ".config/fish" = {
      source = dotfiles/dot_config/fish;
      recursive = true;
    };

    ".config/helix" = {
      source = dotfiles/dot_config/helix;
      recursive = true;
    };

    ".config/nvim" = {
      source = dotfiles/dot_config/nvim;
      recursive = true;
    };
  };

  home.sessionVariables = {
    AWS_VAULT_BACKEND = if pkgs.stdenv.isDarwin then "keychain" else "file";
    EDITOR = "hx";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.
}
