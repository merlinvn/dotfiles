return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300

      local wk = require("which-key")
      wk.setup({
        plugins = { spelling = true },
        presets = {
          text_objects = true,
        },
      })

      -- require("plugins.config.legendary").setup()

      wk.register({
        ["g"] = {
          z = {
            name = "+surround",
          },
        },
        ["<leader>b"] = {
          name = "+buffer",
        },
        ["<leader>c"] = {
          name = "+code",
          s = {
            name = "+swap",
          },
        },
        -- edit: substitute, change, delete, yank, paste, undo, redo
        -- ["<leader>e"] = {
        --   name = "+edit",
        -- },
        ["<leader>d"] = {
          name = "+debug",
        },
        ["<leader>f"] = {
          name = "+files/find",
        },
        ["<leader>g"] = {
          name = "+git",
        },
        ["<leader>n"] = {
          name = "+notes",
        },
        ["<leader>o"] = {
          name = "+options/open",
        },
        ["<leader>q"] = {
          name = "+quit/session",
        },
        ["<leader>r"] = {
          name = "reload",
          -- l = "Reload current luafile",
        },
        ["<leader>s"] = {
          name = "+search",
        },
        ["<leader>t"] = {
          name = "+test/tree",
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
      })
    end,
    enabled = true,
  },
}
