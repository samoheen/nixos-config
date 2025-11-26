{ inputs, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    fastfetch
    unzip
    zip

    grimblast

    aseprite
  ];
}
