{ pkgs, inputs, ... }:

{
  imports = [ inputs.nixvim.homeModules.nixvim ];

  programs.nixvim = {
    enable = true;

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 4;
      tabstop = 4;
      expandtab = true;
      smartindent = true;
      backup = false;
      termguicolors = true;      
    };

    extraPlugins = with pkgs.vimPlugins; [
      catppuccin-nvim
    ];

    extraConfigLua = ''
      -- cattpuccin
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = false,
      })
    '';

    colorscheme = "catppuccin";
  };
}
