{
  programs.neovim = {
    enable = true;
    coc.enable = false;
    viAlias = true;
    vimAlias = true;
    withNodeJs = false; # dont want to install nodejs as a dep
    withPython3 = true;
    withRuby = true;
  };
}
