{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    fastfetch
    unzip
    zip

    aseprite

    nixpkgs-unstable.rustup
    nixpkgs-unstable.go
  ];
}
