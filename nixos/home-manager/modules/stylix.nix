{ pkgs, stylix, ... }:

{
  imports = [ stylix.homeModules.stylix ];

  home.packages = with pkgs; [
    dejavu_fonts

    noto-fonts
    noto-fonts-lgc-plus
    noto-fonts-emoji

    fira-code

    nerd-fonts.fira-code
  ];

  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    cursor = {
      name = "DMZ-Black";
      size = 24;
      package = pkgs.vanilla-dmz;
    };

    fonts = {
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };
      monospace = {
        name = "FiraCode";
        package = pkgs.nerd-fonts.fira-code;
      };
      sansSerif = {
        name = "Noto Sans";
        package = pkgs.noto-fonts;
      };
      serif = {
        name = "Noto Serif";
        package = pkgs.noto-fonts;
      };

      sizes = {
        terminal = 11;
        applications = 10;
      };
    };

    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };

  };
}
