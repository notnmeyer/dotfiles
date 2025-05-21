# docs:
#   - man home-configuration.nix
#   - https://mipmip.github.io/home-manager-option-search/

{ config, pkgs, dotfiles, ... }:
let
  commonPackages = import ./common.nix { inherit pkgs; };
in {

  # required for ngrok
  nixpkgs.config.allowUnfree = true;

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  imports = [
    ./fish.nix
    ./git.nix
    ./neovim.nix
    ./starship.nix
    ./zellij.nix
    (import ./dotfiles.nix { inherit dotfiles; })
  ];

  home.username = "nate";
  home.homeDirectory = "/Users/nate";

  home.packages = with pkgs; [
    awslogs
    anonymousPro
    aws-vault
    bats
    chamber
    container-structure-test
    dive
    gopls
    helm-ls
    httpie
    kubernetes-helm
    ngrok
    swaks
    terraform-ls
    tflint
    yamllint
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
