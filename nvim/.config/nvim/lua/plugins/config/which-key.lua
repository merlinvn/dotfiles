local M = {}

M.config = function()
  vim.o.timeout = true
  vim.o.timeoutlen = 300

  local wk = require("which-key")
  wk.setup({
    plugins = { spelling = true },
    presets = {
      text_objects = true,
    },
  })

  require("plugins.config.legendary").setup()

  wk.register({
    ["<leader>c"] = {
      name = "+code",
      w = "swap next",
      W = "swap previous",
    },
    -- edit: substitute, change, delete, yank, paste, undo, redo
    ["<leader>e"] = {
      name = "+edit",
    },
    ["<leader>g"] = {
      name = "+git",
    },
    ["<leader>o"] = {
      name = "+options/open",
    },
    ["<leader>r"] = {
      name = "reload",
      -- l = "Reload current luafile",
    },
    ["<leader>s"] = {
      name = "+search",
    },
    ["<leader>v"] = {
      name = "+vim",
    },
    ["<leader>w"] = {
      name = "+windows",
    },
    ["<leader>x"] = {
      name = "+diagnotics",
    },
    ["<leader>q"] = {
      name = "+quit",
    },
  })
end

return M
