{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      format = ''
        $directory$c$cpp$go$rust$git_branch$git_status$character
      '';
      c = {
        format = "[$symbol]($style)";
        symbol = "c ";
        style = "fg:#89dceb";
      };
      cpp = {
        format = "[$symbol]($style)";
        symbol = "cpp ";
        style = "fg:#74c7ec";
      };
      character = {
        success_symbol = "[א](bold fg:#a6e3a1)";
        error_symbol = "[א](bold fg:#f38ba8)";
      };
      cmd_duration = { disabled = true; };
      directory = {
        truncation_length = 1;
        style = "fg:#89dceb";
      };
      git_branch = {
        format = "[$branch]($style)";
        style = "fg:#a6e3a1";
      };
      git_status = {
        format = "(\\[$all_status$ahead_behind\\]) ";
        style = "";
        stashed = "[s](fg:#cba6f7)";
        untracked = "[?](fg:#6c7086)";
        staged = "[a](fg:#a6e3a1)";
        deleted = "[d](fg:#f38ba8)";
        modified = "[m](fg:#89b4fa)";
        renamed = "[r](fg:#89b4fa)";
      };
      line_break = { disabled = true; };
      username = { disabled = true; };
      rust = { format = "[rs ](fg:#fab387)"; };
      package = { disabled = true; };
    };
  };
}
