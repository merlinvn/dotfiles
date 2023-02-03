return {
  -- Lsp Config
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Useful status updates for LSP
      "j-hui/fidget.nvim",

      -- Additional lua configuration, makes nvim stuff amazing
      "folke/neodev.nvim",
    },
    config = function()
      require("plugins.lsp.config")
    end
  },
  {
    "j-hui/fidget.nvim",
    config = true
  },
  {
    "folke/neodev.nvim",
    config = true
  },

  "onsails/lspkind-nvim",
  "nvim-lua/lsp_extensions.nvim",
  "simrat39/symbols-outline.nvim",
  -- "glepnir/lspsaga.nvim",

  -- third party code format
  "sbdchd/neoformat",

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

  -- Null lsp
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",

  }, -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  "MunifTanjim/prettier.nvim", -- Prettier plugin for Neovim's built-in LSP client
}
