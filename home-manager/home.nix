# docs:
#   - man home-configuration.nix
#   - https://mipmip.github.io/home-manager-option-search/

{ config, pkgs, dotfiles, ... }:
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
    ./zellij.nix
    (import ./dotfiles.nix { inherit dotfiles; })
  ];

  home.username = "nate";
  # all i care about is if this is macos or linux
  home.homeDirectory = if pkgs.stdenv.isDarwin then "/Users/nate" else "/home/nate";

  home.packages = with pkgs; [
    tailscale
  ] ++ commonPackages;

  programs = {
    bat = {
      enable = true;
      config = {
        theme = "Solarized (dark)";
      };
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    helix.enable = true;
    home-manager.enable = true;
    ripgrep.enable = true;

    # necessary for starship to configure them
    bash.enable = false;
    zsh.enable = false;
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
