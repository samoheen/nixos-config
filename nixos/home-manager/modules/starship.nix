{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      hostname = {
        ssh_only = false;
      };
      username = {
        show_always = true;
      };
    };
  };
}
