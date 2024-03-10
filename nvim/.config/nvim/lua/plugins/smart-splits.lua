return {
  {
    "mrjones2014/smart-splits.nvim",
    opts = {
      resize_mode = {
        silent = true,
        hooks = {
          on_enter = function()
            vim.notify("Entering resize mode")
          end,
          on_leave = function()
            vim.notify("Exiting resize mode, bye")
          end,
        },
      },
    },

    keys = {
      { "<C-Left>", "<cmd>lua require('smart-splits').resize_left()<cr>", desc = "Resize left" },
      { "<C-Down>", "<cmd>lua require('smart-splits').resize_down()<cr>", desc = "Resize down" },
      { "<C-Up>", "<cmd>lua require('smart-splits').resize_up()<cr>", desc = "Resize up" },
      { "<C-Right>", "<cmd>lua require('smart-splits').resize_right()<cr>", desc = "Resize right" },
      -- {
      --   "<C-h>",
      --   "<cmd>lua require('smart-splits').move_cursor_left()<cr>",
      --   desc = "Move curssor left",
      -- },
      -- {
      --   "<C-j>",
      --   "<cmd>lua require('smart-splits').move_cursor_down()<cr>",
      --   desc = "Move curssor down",
      -- },
      -- { "<C-k>", "<cmd>lua require('smart-splits').move_cursor_up()<cr>", desc = "Move cursor up" },
      -- {
      --   mode = "n",
      --   "<C-l>",
      --   "<cmd>lua require('smart-splits').move_cursor_right()<cr>",
      --   desc = "move cursor right",
      -- },
    },
  },
}
