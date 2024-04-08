# docs:
#   - man home-configuration.nix
#   - https://mipmip.github.io/home-manager-option-search/

{ config, pkgs, ... }:

{
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  imports = [
    ./fish.nix
    ./git.nix
    ./neovim.nix
    ./starship.nix
  ];

  home.username = "nmeyer";
  # all i care about is if this is macos or linux
  home.homeDirectory = "/Users/nmeyer";

  home.packages = with pkgs; [
    anonymousPro
    any-nix-shell # use the existing shell with `nix run` and `nix-shell`
    asdf-vm
    awscli2
    aws-vault
    docker-compose
    fd
    fzf
    git
    gitflow
    git-lfs
    glow
    gnumake
    gnutar
    go
    go-task
    gradle
    htop
    inetutils # for telnet
    jq
    kotlin-language-server
    lazygit
    lua-language-server
    # libgcc # not available on macos :\
    maven
    nil # nix ls
    nodePackages.bash-language-server
    postgresql_16
    qemu
    shellcheck
    tig
    tmux
    tree
    watchexec
    wget
    yarn
    yq
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
    bash.enable = false;
    zsh.enable = false;
  };

  home.file = {
    ".config/alacritty/alacritty.yml".source = dotfiles/dot_config/alacritty/alacritty.yml;
    ".terraformrc".source = dotfiles/dot_terraformrc;
    ".tmux.conf".source = dotfiles/dot_tmux.conf;
    ".wezterm.lua".source = dotfiles/dot_wezterm.lua;

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
