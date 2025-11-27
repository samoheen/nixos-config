{ inputs, pkgs, ... }:

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

    nixfmt-rfc-style
    nixd
  ];
}
