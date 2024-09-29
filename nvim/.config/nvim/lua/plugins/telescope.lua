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
      file_ignore_patterns = { "docs/Doxygen/.*" }, -- This line ignores docs/Doxygen folder
    },
  },
  keys = {
    { "<leader>ff", false },
    { "<leader>,", false },
    { "<leader><space>", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Find opening buffers" },
    { "<leader>p", LazyVim.pick("auto"), desc = "Find Files (root dir)" },
    { "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "[/] Fuzzily search in current buffer" },
    {
      "<leader>vn",
      function()
        require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "Find Plugin File",
    },
    {
      "<leader>vd",
      function()
        -- check if the folder exists, it could be .dotfiles or dotfiles
        local dotfiles = vim.fn.isdirectory(vim.fn.expand("$HOME/.dotfiles")) == 1 and "$HOME/.dotfiles"
          or "$HOME/.dotfiles"
        require("telescope.builtin").git_files({ cwd = dotfiles })
      end,
      desc = "Find Dotfiles",
    },
  },
}
