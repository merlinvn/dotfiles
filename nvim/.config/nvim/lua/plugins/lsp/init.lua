return {
  -- Lsp Config
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Useful status updates for LSP
      "j-hui/fidget.nvim",

      -- Additional lua configuration, makes nvim stuff amazing
      "folke/neodev.nvim",
      {
        "simrat39/rust-tools.nvim",
        event = "VeryLazy",
      },
    },
    opts = { -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = true,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
        float = {
          source = "always", -- Or "if_many"
        },
      },
      -- Automatically format on save
      autoformat = true,
      -- options for vim.lsp.buf.format
      -- `bufnr` and `filter` is handled by the LazyVim formatter,
      -- but can be also overriden when specified
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      -- LSP Server Settings
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--suggest-missing-includes",
            "--clang-tidy",
            "--header-insertion=iwyu",
          },
        },
        gopls = {},
        pyright = {},
        tsserver = {
          filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
          },
          cmd = { "typescript-language-server", "--stdio" },
        },
        sumneko_lua = {
          settings = {
            Lua = {
              format = {
                enable = false,
                defaultConfig = {
                  indent_type = "space",
                  indent_size = 2,
                },
              },
              runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
              },
              workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false, -- THIS IS THE IMPORTANT LINE TO ADD
              },
              completion = {
                callSnippet = "Replace",
              },
              -- Do not send telemetry data containing a randomized but unique identifier
              telemetry = {
                enable = false,
              },
              diagnostics = {
                globals = {
                  "vim",
                  "use",
                  "t",
                },
              },
            },
          },
        },
        tailwindcss = {},
        dockerls = {},
        cmake = {},
        ["rust_analyzer"] = {
          mason = false,
          settings = {
            ["rust-analyzer"] = {
              assist = {
                importEnforceGranularity = true,
                importPrefix = "crate",
              },
              cargo = {
                allFeatures = true,
              },
              checkOnSave = {
                -- default: `cargo check`
                command = "clippy",
              },
            },
            inlayHints = {
              lifetimeElisionHints = {
                enable = true,
                useParameterNames = true,
              },
            },
          },
          on_attach = function(client, buffer)
            require("plugins.lsp.format").on_attach(client, buffer)
            require("plugins.lsp.keymaps").lsp_on_attach_rust(client, buffer)
          end,
        },
        -- hsl = {},
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      setup = {
        rust_analyzer = function(_, opts)
          require("rust-tools").setup({ server = opts })
          return true
        end,
        -- example to setup with typescript.nvim
        -- tsserver = function(_, opts)
        --   require("typescript").setup({ server = opts })
        --   return true
        -- end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
    config = function(_, opts)
      require("plugins.lsp.config").config(opts)
    end,
  },
  -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local null_ls = require("null-ls")
      return {
        sources = {
          null_ls.builtins.diagnostics.eslint_d.with({
            diagnostics_format = "[eslint] #{m}\n(#{c})",
          }),
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.diagnostics.flake8,
          -- null_ls.builtins.diagnostics.fish
          -- null_ls.builtins.formatting.clang_format
          -- null_ls.builtins.formatting.cmake_format
          -- null_ls.builtins.formatting.gofmt
        },
      }
    end,
  },
  -- cmdline tools and lsp servers
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>vm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
    ---@param opts MasonSettings | {ensure_installed: string[]}
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },
  {
    "j-hui/fidget.nvim",
    config = true,
  },
  {
    "folke/neodev.nvim",
    event = "BufReadPre",
    config = true,
  },

  "onsails/lspkind-nvim",
  "nvim-lua/lsp_extensions.nvim",
  "simrat39/symbols-outline.nvim",
  -- lspsaga is still buggy
  -- {
  --   "glepnir/lspsaga.nvim",
  --   event = "BufRead",
  --   opts = {
  --     rename= {
  --       quit = "<esc>",
  --     },
  --     scroll_preview = {
  --       scroll_down = "<C-d>",
  --       scroll_up = "<C-u>",
  --     },
  --     beacon = {
  --       enable = false,
  --       frequency = 7,
  --     },
  --   },
  --   dependencies = { { "nvim-tree/nvim-web-devicons" } }
  -- }
  -- Better LSP experience
  -- {
  --   "j-hui/fidget.nvim",
  --   config = function()
  --     require "fidget".setup {
  --       window = {
  --         blend = 0,
  --       },
  --     }
  --   end
  -- },
}
