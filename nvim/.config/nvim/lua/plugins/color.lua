return {
  -- -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      transparent_mode = true,
      styles = {
        sidebars = "transparent",
        float = "transparent",
      },
    },
  },
  --
  -- -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
  -- {
  --   "folke/tokyonight.nvim",
  --   opts = {
  --     transparent = true,
  --     styles = {
  --       sidebars = "transparent",
  --       floats = "transparent",
  --     },
  --   },
  -- },
}
