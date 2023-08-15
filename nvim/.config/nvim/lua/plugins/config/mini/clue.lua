local M = {}

M.config = function()
  local miniclue = require("mini.clue")

  miniclue.setup({
    window = {
      config = {
        anchor = "SE",
        row = "auto",
        col = "auto",
      },
      -- Keys to scroll inside the clue window
      scroll_down = "<C-d>",
      scroll_up = "<C-u>",
    },
    triggers = {
      -- Leader triggers
      { mode = "n", keys = "<Leader>" },
      { mode = "x", keys = "<Leader>" },

      -- Built-in completion
      { mode = "i", keys = "<C-x>" },

      -- `g` key
      { mode = "n", keys = "g" },
      { mode = "x", keys = "g" },

      -- Marks
      { mode = "n", keys = "'" },
      { mode = "n", keys = "`" },
      { mode = "x", keys = "'" },
      { mode = "x", keys = "`" },

      -- Registers
      { mode = "n", keys = '"' },
      { mode = "x", keys = '"' },
      { mode = "i", keys = "<C-r>" },
      { mode = "c", keys = "<C-r>" },

      -- Window commands
      { mode = "n", keys = "<C-w>" },

      -- `z` key
      { mode = "n", keys = "z" },
      { mode = "x", keys = "z" },

      { mode = "n", keys = "[" },
      { mode = "n", keys = "]" },
      { mode = "x", keys = "[" },
      { mode = "x", keys = "]" },
    },

    clues = {
      -- Enhance this by adding descriptions for <Leader> mapping groups
      miniclue.gen_clues.builtin_completion(),
      miniclue.gen_clues.g(),
      miniclue.gen_clues.marks(),
      miniclue.gen_clues.registers({ show_contents = true }),
      miniclue.gen_clues.windows({ submode_resize = true }),
      miniclue.gen_clues.z(),
      { mode = "n", keys = "<Leader>b", desc = "+Buffers" },
      { mode = "n", keys = "<Leader>c", desc = "+Code" },
      { mode = "n", keys = "<Leader>d", desc = "+Dap" },
      { mode = "n", keys = "<Leader>f", desc = "+Files/Find" },
      { mode = "n", keys = "<Leader>g", desc = "+Git" },
      { mode = "n", keys = "<Leader>o", desc = "+Toggle" },
      { mode = "n", keys = "<Leader>q", desc = "+Quit/Sessions" },
      { mode = "n", keys = "<Leader>r", desc = "+Reload" },
      { mode = "n", keys = "<Leader>s", desc = "+Search" },
      { mode = "n", keys = "<Leader>t", desc = "+NeoTree" },
      { mode = "n", keys = "<Leader>v", desc = "+Vim" },
      { mode = "n", keys = "<Leader>w", desc = "+Window" },
      { mode = "n", keys = "<Leader>x", desc = "+Diagnotics" },
    },
  })
end

return M
