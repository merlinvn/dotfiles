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
    event = "BufReadPre",
    config = true
  },

  "onsails/lspkind-nvim",
  "nvim-lua/lsp_extensions.nvim",
  "simrat39/symbols-outline.nvim",
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    opts = {
      rename= {
        quit = "<esc>",
      },
      scroll_preview = {
        scroll_down = "<C-d>",
        scroll_up = "<C-u>",
      },
      beacon = {
        enable = false,
        frequency = 7,
      },
    },
    dependencies = { { "nvim-tree/nvim-web-devicons" } }
  }

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
}
