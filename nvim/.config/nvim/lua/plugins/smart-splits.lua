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
      { "<C-Left>", "<cmd>lua require('smart-splits').resize_left()<cr>" },
      { "<C-Down>", "<cmd>lua require('smart-splits').resize_down()<cr>" },
      { "<C-Up>", "<cmd>lua require('smart-splits').resize_up()<cr>" },
      { "<C-Right>", "<cmd>lua require('smart-splits').resize_right()<cr>" },
      {
        "<C-h>",
        "<cmd>lua require('smart-splits').move_cursor_left()<cr>",
      },
      {
        "<C-j>",
        "<cmd>lua require('smart-splits').move_cursor_down()<cr>",
      },
      { "<C-k>", "<cmd>lua require('smart-splits').move_cursor_up()<cr>" },
      {
        "<C-l>",
        "<cmd>lua require('smart-splits').move_cursor_right()<cr>",
      },

      -- {
      --   "<leader>wh",
      --   "<cmd>lua require('smart-splits').swap_buf_left()<cr>",
      --   desc = "swap window left",
      -- },
      -- {
      --   "<leader>wj",
      --   "<cmd>lua require('smart-splits').swap_buf_down()<cr>",
      --   desc = "swap window down",
      -- },
      -- {
      --   "<leader>wk",
      --   "<cmd>lua require('smart-splits').swap_buf_up()<cr>",
      --   desc = "swap window up",
      -- },
      -- {
      --   "<leader>wl",
      --   "<cmd>lua require('smart-splits').swap_buf_right()<cr>",
      --   desc = "swap window right",
      -- },
      -- {
      --   "<leader>wr",
      --   "<cmd>lua require('smart-splits').start_resize_mode()<cr>",
      --   desc = "resize mode",
      -- },
    },
  },
}
