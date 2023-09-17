{
  programs.neovim = {
    enable = true;
    coc.enable = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = true;

    extraLuaConfig = ''
      lvim.format_on_save.enabled = true
    '';
    extraConfig = ''
      lvim.format_on_save.enabled = true
    '';
  };
}
