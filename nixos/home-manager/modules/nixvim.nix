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
      vim-nix

      nvim-treesitter
      nvim-treesitter-parsers.c
      nvim-treesitter-parsers.cpp
      nvim-treesitter-parsers.go
      nvim-treesitter-parsers.python
      nvim-treesitter-parsers.nix
      nvim-treesitter-parsers.rust

      nvim-lspconfig
      nvim-lsp-ts-utils
      lspkind-nvim

      telescope-nvim
      telescope-fzf-native-nvim
      plenary-nvim

      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      luasnip

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
