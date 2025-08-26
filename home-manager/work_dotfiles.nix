{ dotfiles }:
{
  home.file = {
    ".config/aerospace/aerospace.toml".source = dotfiles/dot_config/aerospace/aerospace.toml;
    ".config/alacritty/alacritty.yml".source = dotfiles/dot_config/alacritty/alacritty.yml;
    ".config/ghostty/config".source = dotfiles/dot_config/ghostty/config;
    ".config/zellij/config.kdl".source = dotfiles/dot_config/zellij/config.kdl;
    ".default-npm-packages".source = dotfiles/dot_default-npm-packages;
    ".gemrc".source = dotfiles/dot_gemrc;
    ".terraformrc".source = dotfiles/dot_terraformrc;
    ".tmux.conf".source = dotfiles/dot_tmux.conf;
    ".tool-versions".source = work_dotfiles/dot_tool-versions;
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
}
