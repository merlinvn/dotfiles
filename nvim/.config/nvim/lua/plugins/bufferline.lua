return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      numbers = "ordinal",
      mode = "tabs",
      show_buffer_close_icons = false,
      show_close_icon = false,
    },
  },
  keys = {
    { "<leader>bp", false },
    { "<leader>bP", false },
    { "<leader>bo", false },
    { "<leader>br", false },
    { "<leader>bl", false },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev tab" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next tab" },
    { "[b", "<cmd>bprev<cr>", desc = "Prev buffer" },
    { "]b", "<cmd>bnext<cr>", desc = "Next buffer" },
  },
}
