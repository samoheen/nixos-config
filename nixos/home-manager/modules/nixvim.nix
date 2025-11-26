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

    keymaps = [
      {
        key = "<leader>f";
        telescope = "<cmd>Neotree<cr>";
      }
    ];

    extraPlugins = with pkgs.vimPlugins; [
      catppuccin-nvim

      neo-tree-nvim
    ];

    extraConfigLua = ''
      -- cattpuccin
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = false,
      })
    '';

    colorscheme = "catppuccin";

    globals = {
        mapleader = " ";
    };
  };
}
