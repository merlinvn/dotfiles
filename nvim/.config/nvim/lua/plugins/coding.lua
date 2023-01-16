return {
  -- auto completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-emoji",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      -- "hrsh7th/cmp-copilot",
      -- "ray-x/cmp-treesitter",
      -- "f3fora/cmp-spell",
      -- "octaltree/cmp-look",
    }
  },

  "rafamadriz/friendly-snippets",

  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },

  -- Debug
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "theHamsta/nvim-dap-virtual-text",

  -- commenter
  -- "terrortylor/nvim-comment",
  -- "numToStr/Comment.nvim",
  "echasnovski/mini.comment",

  -- AI assistant
  -- { "tzachar/cmp-tabnine", build = "./install.sh", dependencies = "hrsh7th/nvim-cmp" },
  -- "github/copilot.vim",
  {
    "zbirenbaum/copilot.lua",
    -- event = "InsertEnter",
    -- config = function()
    --   vim.schedule(function()
    --     require("copilot").setup()
    --   end, 100)
    -- end,
  },

  -- {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua" },
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end
  -- },

  -- Langague specific
  -- Rust:
  "simrat39/rust-tools.nvim",
  -- C++:
  "cdelledonne/vim-cmake",
}
