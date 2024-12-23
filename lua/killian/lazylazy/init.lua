return {
      --{
      --    "rose-pine/neovim",
      --    name = "rose-pine",
      --    config = function()
      --        vim.cmd("colorscheme rose-pine")
      --    end

      --},
      {
          "ellisonleao/gruvbox.nvim",
          name = "gruvbox",
          config = function()
              vim.cmd("colorscheme gruvbox")
          end
      },
      -- nvim doing
      {
          "Hashino/doing.nvim",
          config = true,
      },
      -- nvim marks (better marks)
      {
        "chentoast/marks.nvim",
        event = "VeryLazy",
        opts = {},
      },

      -- trouble
--      {
--          "folke/trouble.nvim",
--          opts = {}, -- for default options, refer to the configuration section for custom setup.
--          cmd = "Trouble",
--          keys = {
--            {
--              "<leader>xx",
--              "<cmd>Trouble diagnostics toggle<cr>",
--              desc = "Diagnostics (Trouble)",
--            },
--            {
--              "<leader>xX",
--              "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
--              desc = "Buffer Diagnostics (Trouble)",
--            },
--            {
--              "<leader>cs",
--              "<cmd>Trouble symbols toggle focus=false<cr>",
--              desc = "Symbols (Trouble)",
--            },
--            {
--              "<leader>cl",
--              "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
--              desc = "LSP Definitions / references / ... (Trouble)",
--            },
--            {
--              "<leader>xL",
--              "<cmd>Trouble loclist toggle<cr>",
--              desc = "Location List (Trouble)",
--            },
--            {
--              "<leader>xQ",
--              "<cmd>Trouble qflist toggle<cr>",
--              desc = "Quickfix List (Trouble)",
--            },
--          },
--        },

      {
          "nvim-treesitter/nvim-treesitter",
          name = "treesitter",
          build = ":TSUpdate",
      },
      {
          "tpope/vim-fugitive",
          name = "fugitive"
      },
      {
          "psliwka/vim-smoothie",
          name = "vim-smoothie"
      },
      {
          'nvim-tree/nvim-tree.lua',
          dependencies = { 'nvim-tree/nvim-web-devicons' }
      },
      -- tmux navigation
      {
          "christoomey/vim-tmux-navigator",
      },
        {
            "folke/which-key.nvim",
            config = function()
                vim.o.timeout = true;
                vim.o.timeoutlen = 300;
                require("which-key").setup {
                }
            end
        },
        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' },
            config = {
                function()
                    require('lualine').setup {
                        sections = {
                            lualine_x = {'fileformat', 'filetype'},
                        },
                        options = {
                            theme = 'gruvbox', -- Or set a specific theme
                        },
                        winbar = {
                            lualine_a = { require"doing.api".status },
                        }
                    }
                end
            }
        },

      -- lsp stuff
      {
          "williamboman/mason.nvim",
          name = "mason",
          config =
            function()
                require("mason").setup()
            end
      },
      {
          "neovim/nvim-lspconfig",
          name = "lspconfig",
          dependencies = { "mason-lspconfig" },
          config =
              function()
                  local on_att =
                      function(_, _)
                          vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
                      end
                  require("lspconfig").lua_ls.setup({
                      on_attach = on_att
                  })
                  -- setup mason auto install
                  -- No clue how to fix this
--                local mason_lspconfig = require("mason-lspconfig")
--                -- auto handlers
--                mason_lspconfig.setup_handlers({
--                    -- The first entry (without a key) will be the default handler
--                    -- and will be called for each installed server that doesn't have
--                    -- a dedicated handler.
--                    function (server_name) -- default handler (optional)
--                        require("lspconfig")[server_name].setup {}
--                    end,
--                    -- Next, you can provide a dedicated handler for specific servers.
--                    -- For example, a handler override for the `rust_analyzer`:
--                    ["rust_analyzer"] = function ()
--                        require("rust-tools").setup {}
--                    end
--                })
              end
      },
      -- completions stuff
      {
          "hrsh7th/nvim-cmp",
      },
      {
          "hrsh7th/cmp-nvim-lsp",
      },
      -- nvim-surround 
      -- TODO: troubleshoot
--      use({
--        "kylechui/nvim-surround",
--        tag = "main", -- Use for stability; omit to use `main` branch for the latest features
--        config = function()
--            require("nvim-surround").setup({
--                -- Configuration here, or leave empty to use defaults
--            })
--        end
--      })
--
--      -- codewhisperer
--      -- TODO
        {
            "codewhisperer",
            name = "codewhisperer",
            url = "ssh://git.amazon.com/pkg/AmazonCodeWhispererVimPlugin",
            cmd = { "CWGenerateNvim", "CWTest", "CWPythonVersion" },
            keys = {
              { "<C-h>", "<cmd>:CWGenerateNvim<CR>", mode = { "i" }, desc = "CodeWhisperer complete" },
            },
            build = [[cat ~/.local/share/nvim/lazy/codewhisperer/service-2.json | jq '.metadata += {"serviceId":"codewhisperer"}' | tee /tmp/aws-coral-model.json && aws configure add-model --service-model file:///tmp/aws-coral-model.json --service-name codewhisperer]],
            dependencies = {
              { "nvim-telescope/telescope.nvim" },
            },
            config = function()
              require("codewhisperer").setup()
            end,
        },
--      
--      -- markdown previewer
--      -- TODO: fix on dev desk
--      --    works by using `open` or `xdg-open` commands, which is fine
--      --    on mac but AL2 dev desk doesn't have either. downloaded xdg-utils
--      --    source but couldn't make it correctly
--        use({
--            "iamcco/markdown-preview.nvim",
--            run = function() vim.fn["mkdp#util#install"]() end,
--        })
--
--        -- formatter
--        use { 'mhartington/formatter.nvim' }

--  spec = {
--    -- import your plugins
--    { import = "plugins" },
--  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
}
