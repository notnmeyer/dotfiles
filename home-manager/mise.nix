{
  programs.mise = {
    enable = true;

    enableBashIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;

    globalConfig.settings = {
      "idiomatic_version_file_enable_tools" = ["node"];
    };
  };
}
