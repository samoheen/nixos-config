{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fastfetch
    unzip
    zip
    grimblast
    hyprlock
    aseprite
    ueberzugpp
    w3m
    fzf
    ffmpeg
    ffmpegthumbnailer
    brightnessctl

    nixfmt-rfc-style
    nixd

    telegram-desktop

    obsidian

    cmus
  ];
}
