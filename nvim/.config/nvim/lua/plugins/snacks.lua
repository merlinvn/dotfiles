return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    terminal = {
      -- Terminal configuration
      win = {
        position = "float",
        backdrop = 60,
        height = 0.8,
        width = 0.8,
        zindex = 50,
        border = "rounded",
      },
    },
  },
}
