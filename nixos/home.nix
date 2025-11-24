{ config, pkgs, ... }:

{
  home = {
    username = "sam";
    homeDirectory = "/home/sam";
    packages = with pkgs; [
      fastfetch
    ];
    stateVersion = "25.05";
  };
  programs = {
    git = {
      enable = true;
      userName = "Sam O'Heen";
      userEmail = "samoheen@hotmail.com";
    };
  };
}

