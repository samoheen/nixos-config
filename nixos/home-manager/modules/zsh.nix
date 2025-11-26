{ config, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases =
      let
        flakeDir = "~/.nixos-config/nixos";
      in {
        gs = "git status";
        ga = "git add";
        gc = "git commit";
        gp = "git push";
        v = "nvim";
        cn = "cargo new";
        cb = "cargo build";
        cr = "cargo run";
        ct = "cargo test";
      };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";
  };
}
