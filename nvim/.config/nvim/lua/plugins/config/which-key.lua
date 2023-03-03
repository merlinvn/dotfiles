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
  wk.register({
    ["<leader>r"] = {
      name = "reload",
      l = "Reload current luafile",
    },
    ["<leader>g"] = {
      name = "+git",
    },
    ["<leader>w"] = {
      name = "+windows",
    },
    ["<leader>o"] = {
      name = "+options/open",
    },
    ["<leader>t"] = {
      name = "+telescope",
    },
    ["<leader>v"] = {
      name = "+vim",
    },
    ["<leader>x"] = {
      name = "+diagnotics",
    },
    ["<leader>b"] = {
      name = "+buffers",
    },
    ["<leader>c"] = {
      name = "+code",
      w = "swap next",
      W = "swap previous",
    },
  })
end

return M
