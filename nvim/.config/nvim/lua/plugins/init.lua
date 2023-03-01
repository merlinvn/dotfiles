return {
  -- "lewis6991/impatient.nvim",
  -- {{{ Must-have
  -- TJ created lodash of neovim
  {
    "nvim-lua/plenary.nvim",
    lazy = false,
  },

  -- }}}

  --{{{ UI
  -- Color highlight
  {
    "norcalli/nvim-colorizer.lua",
    event = "VeryLazy",
    config = function()
      require("colorizer").setup()
    end,
  },

  -- status line
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    opts = require("plugins.config.lualine").opts,
  },

  -- toggle terminal
  {
    "akinsho/toggleterm.nvim",
    branch = "main",
    opts = require("plugins.config.toggleterm").opts,
    keys = require("plugins.config.toggleterm").keys,
  },
  -- Colorscheme section
  { "tjdevries/colorbuddy.nvim" },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      -- vim.cmd([[colorscheme gruvbox]])
      require("plugins.config.color").colorMyPencils("gruvbox")
    end,
    enabled = false,
  },

  {
    "arturgoms/moonbow.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      -- vim.cmd([[colorscheme gruvbox]])
      require("plugins.config.color").colorMyPencils("moonbow")
    end,
    enabled = true,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("plugins.config.catppuccin").config()
    end,
    enabled = false,
  },

  {
    "folke/noice.nvim",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- "rcarriga/nvim-notify",
    },
    opts = require("plugins.config.noice").opts,
  },
  --}}} end of UI

  --
  -- misc
  -- "axkirillov/easypick.nvim",
  -- { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },
  -- {'krady21/compiler-explorer.nvim'},

  -- Note taking

  -- Training & games
  -- "tjdevries/train.nvim",
  -- { "ja-ford/delaytrain.nvim", config = function()
  --   require("delaytrain").setup(
  --     {
  --       grace_period = 2,
  --     }
  --   )
  -- end },
}
