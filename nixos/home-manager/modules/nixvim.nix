{ pkgs, inputs, ... }:

{
  imports = [ inputs.nixvim.homeModules.nixvim ];

  programs.nixvim = {
    enable = true;
    opts = {
      number = true;
      relativenumber = true;
      shiftWidth = 4;
    };
    extraPlugins = with pkgs.vimPlugins; [
      vim-nix
    ];
  };
}
