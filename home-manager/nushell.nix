{
  programs.nushell = {
    enable = true;
    extraEnv = ''
      $env.config = {
        show_banner: false,
      }
    '';
  };
}
