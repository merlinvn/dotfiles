return {
  {
    "akinsho/toggleterm.nvim",
    branch = "main",

    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 10
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.33
        end
        return 20
      end,
      open_mapping = [[<C-t>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      -- direction = "float",
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        -- The border key is *almost* the same as 'nvim_win_open'
        -- see :h nvim_win_open for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        border = "curved",
        -- width = <value>,
        -- height = <value>,
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    },
    keys = {
      { "<C-t>", "<cmd>ToggleTerm<cr>" },
      { "<M-1>", "<cmd>exe v:count1 . 'ToggleTerm direction=horizontal'<cr>" },
      { "<M-2>", "<cmd>exe v:count1 . 'ToggleTerm direction=vertical'<cr>" },
      { "<M-3>", "<cmd>exe v:count1 . 'ToggleTerm direction=float'<cr>" },
    },
  },

}
