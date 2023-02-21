return {
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    opts = {
      plugins = { spelling = true },
      presets = {
        text_objects = true,
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
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
        ["<leader>n"] = {
          name = "+neoorg",
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
    end,
  },
}
