return {
  -- Color highlight
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require "colorizer".setup()
    end
  },

  -- "machakann/vim-highlightedyank",

  -- UI improvement
  -- dashboard
  "echasnovski/mini.starter",
  -- "mhinz/vim-startify",
  -- "goolord/alpha-nvim",
  -- use({
  --   "folke/noice.nvim",
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     "rcarriga/nvim-notify",
  --   }
  -- })

  -- -- status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true }
  },

  -- tabline
  { 'akinsho/bufferline.nvim', version = "v3.*", dependencies = 'nvim-tree/nvim-web-devicons' },

  -- GUI Keymaps
  "anuvyklack/hydra.nvim",
  "folke/which-key.nvim",

  -- Colorscheme section
  "tjdevries/colorbuddy.nvim",
  "morhetz/gruvbox",
  -- "gruvbox-community/gruvbox",
  -- "folke/tokyonight.nvim",
  -- "rebelot/kanagawa.nvim",
  -- "B4mbus/oxocarbon-lua.nvim",
  -- { "catppuccin/nvim", as = "catppuccin" },
  -- use 'navarasu/onedark.nvim'
  -- use({
  --   'rose-pine/neovim',
  --   as = 'rose-pine',
  --   config = function()
  --     vim.cmd('colorscheme rose-pine')
  --   end
  -- })
  -- { "shaunsingh/oxocarbon.nvim", build = "./install.sh" },

}
