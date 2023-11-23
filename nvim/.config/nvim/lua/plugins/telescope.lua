local Util = require("lazyvim.util")
local actions = require("telescope.actions")

return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<c-t>"] = actions.select_tab,
        },
      },
    },
  },
  keys = {
    { "<leader>ff", false },
    { "<leader>,", false },
    { "<leader><space>", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Find opening buffers" },
    { "<leader>p", Util.telescope("files"), desc = "Find Files (root dir)" },
    { "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Grep Current Buffer" },
    {
      "<leader>vn",
      function()
        require("telescope.builtin").find_files({ cwd = "~/.config/nvim" })
      end,
      desc = "Find Plugin File",
    },
    {
      "<leader>vd",
      function()
        require("telescope.builtin").git_files({ cwd = "~/dotfiles/" })
      end,
      desc = "Find Dotfiles",
    },
  },
}
