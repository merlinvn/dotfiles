return {
  {
    "sudormrfbin/cheatsheet.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
    opts = {
      bundled_cheatsheets = false,
    },
    cmd = {
      "Cheatsheet",
      "CheatsheetEdit",
    },
    keys = {
      {
        "<leader>hh",
        "<cmd>Cheatsheet<cr>",
        desc = "Cheatsheet",
      },
      {
        "<leader>he",
        "<cmd>CheatsheetEdit<cr>",
        desc = "CheatsheetEdit",
      },
    },
  },
  -- {
  --   -- Automatically turns off search highlighing when move away from it.
  --   -- Very cool!
  --   "https://github.com/romainl/vim-cool",
  --   event = { "BufReadPre", "BufNewFile" },
  -- },
}