return {
  {
    -- https://github.com/vim-test/vim-test
    "vim-test/vim-test",
    keys = {
      { "<leader>tr", "<cmd>TestNearest<cr>", desc = "Test nearest" },
      { "<leader>tt", "<cmd>TestFile<cr>",    desc = "Test file" },
      { "<leader>ts", "<cmd>TestSuite<cr>",   desc = "Test suite" },
      { "<leader>tl", "<cmd>TestLast<cr>",    desc = "Test last" },
      { "<leader>tv", "<cmd>TestVisit<cr>",   desc = "Test visit" },
    },
    config = function()
      vim.g["test#strategy"] = "neovim"
      vim.g["test#neovim#term_position"] = "vert 60"
      vim.g["test#neovim#term_reuse"] = 1
    end,
  },

}
