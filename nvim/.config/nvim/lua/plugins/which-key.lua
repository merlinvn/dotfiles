return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      defaults = {
        ["<leader>v"] = { name = "+vim" },
        ["<leader>d"] = { name = "+delete" },
        ["<leader>t"] = { name = "+tabs/tests" },
      },
    },
  },
}
