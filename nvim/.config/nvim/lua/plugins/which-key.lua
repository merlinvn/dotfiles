return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      defaults = {
        ["<leader>v"] = { name = "+vim" },
        ["<leader>d"] = { name = "+delete/debug" },
        ["<leader>t"] = { name = "+tabs/tests" },
        ["<leader>h"] = { name = "+harpoon" },
      },
    },
  },
}
