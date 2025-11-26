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
      laststatus = 2;
      showmode = false;
    };

    keymaps = [
      {
        key = "<leader>f";
        action = "<cmd>Neotree toggle<cr>";
        mode = "n";
        options.desc = "Open file tree";
      }
    ];

    extraPlugins = with pkgs.vimPlugins; [
      catppuccin-nvim

      neo-tree-nvim
      plenary-nvim
      nui-nvim
      nvim-web-devicons

      nvim-lspconfig
      lspkind-nvim

      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      luasnip

      trouble-nvim
      fidget-nvim

      nvim-treesitter
      nvim-treesitter-parsers.nix
      nvim-treesitter-parsers.rust

      lightline-vim
    ];

    extraConfigLua = ''
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = true,
            cargo = {
              allFeatures = true,
            },
            procMacro = {
              enable = true,
            },
          }
        }
      })

      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
          { name = 'path' },
        })
      })

      vim.g.lightline = {
        colorscheme = 'catppuccin',
      }
      
      vim.diagnostic.config({ virtual_text = true })

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
