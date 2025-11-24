{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    fastfetch
  ];

  programs.kitty.enable = true;
  wayland.windowManager.hyprland.enable = true;
}
