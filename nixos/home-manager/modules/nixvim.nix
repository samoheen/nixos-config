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
        key = "<leader>e";
        action = "<cmd>Neotree toggle<cr>";
        mode = "n";
        options.desc = "Toggle Neotree";
      }
      {
        key = "<leader>o";
        action = "<cmd>Neotree focus<cr>";
        mode = "n";
        options.desc = "Focus Neotree";
      }
      {
        key = "<leader>qq";
        action = "<cmd>qa<cr>";
        mode = "n";
        options.desc = "Close all files";
      }
      {
        key = "<leader>ww";
        action = "<cmd>wa<cr>";
        mode = "n";
        options.desc = "Save all files";
      }
      {
        key = "<leader>wq";
        action = "<cmd>wqa<cr>";
        mode = "n";
        options.desc = "Save and close all files";
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
      require('neo-tree').setup({
        close_if_last_window = true,
        window = {
          mappings = {
            ['<cr>'] = "open",
            ['l'] = "open",
            ['h'] = "close_node",
            ['<Tab>'] = "focus_preview",
            ['P'] = { "toggle_preview", config = { use_float = true } },
          }
        },
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
          },
          follow_current_file = {
            enabled = true,
          },
        }
      })


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
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(-4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        });
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
