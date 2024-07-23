return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        ["<leader>v"] = { group = "vim" },
        ["<leader>d"] = { group = "delete/debug" },
        ["<leader>t"] = { group = "tabs/tests" },
        -- ["<leader>h"] = { name = "+harpoon" },
      },
    },
  },
}
