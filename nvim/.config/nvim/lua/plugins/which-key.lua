return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
      presets = {
        text_objects = true,
      }
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
          name = "Git",
        },
        ["<leader>f"] = {
          name = "find"
        },
        ["<leader>w"] = {
          name = "+windows",
        },
        ["<leader>o"] = {
          name = "+options/open",
        },
        ["<leader>n"] = {
          name = "+neotree",
        },
        ["<leader>b"] = {
          name = "+buffers",
        },
        ["<leader>c"] = {
          name = "+code",
          w = "swap next",
          W = "swap previous",
        }
      })
    end,
  },

}