{ pkgs, stylix, ... }:

{
  imports = [ stylix.homeModules.stylix ];

  # fonts.fontconfig.enable = true;
  # fonts.packages = [

  # pkgs.noto-fonts
  # pkgs.noto-fonts-lgc-plus
  # pkgs.noto-fonts-emoji

  # pkgs.nerd-fonts.droid-sans-mono
  # ];

  home.packages = with pkgs; [
    # dejavu_fonts

    noto-fonts
    noto-fonts-lgc-plus
    noto-fonts-color-emoji

    # fira-code

    # nerd-fonts.fira-code
    # nerd-fonts.noto
    nerd-fonts.ubuntu-mono
    nerd-fonts.meslo-lg
    nerd-fonts.roboto-mono
    nerd-fonts.fira-mono
    # nerd-fonts.fira-code
    # nerd-fonts.dejavu-sans-mono
  ];

  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    cursor = {
      name = "DMZ-Black";
      size = 18;
      package = pkgs.vanilla-dmz;
    };

    fonts = {
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };
      monospace = {
        name = "FiraMonoNerdFont";
        package = pkgs.nerd-fonts.fira-mono;
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
        terminal = 10;
        applications = 10;
      };
    };

    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };

    # targets = {
    # zen-browser.profileNames = [ "default" ];
    # };

  };
}
