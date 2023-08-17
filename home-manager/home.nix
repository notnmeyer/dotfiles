{ config, pkgs, ... }:

{
  imports = [
    ./fish.nix
    ./git.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "nate";
  home.homeDirectory = "/home/nate";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  home = {
    packages = with pkgs; [
      # fonts
      anonymousPro
      
      docker
      gh
      fish
      helix
      ripgrep
    ];
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/alacritty/alacritty.yml".source = dotfiles/dot_config/alacritty/alacritty.yml;
    ".config/fish/functions/fish_prompt.fish".source = dotfiles/dot_config/fish/functions/fish_prompt.fish;
    ".config/helix/config.toml".source = dotfiles/dot_config/helix/config.toml;
    ".gemrc".source = dotfiles/dot_gemrc;
    ".terraformrc".source = dotfiles/dot_terraformrc;
    ".tmux.conf".source = dotfiles/dot_tmux.conf;
    ".wezterm.lua".source = dotfiles/dot_wezterm.lua;
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/nate/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    AWS_DEFAULT_REGION = "us-east-1";
    AWS_DEFAULT_OUTPUT = "json";
    EDITOR = "hx";
  };

  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;
    bat.enable = true;
  };
}
