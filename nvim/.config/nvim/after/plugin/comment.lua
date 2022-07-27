require('Comment').setup({

  ---LHS of toggle mappings in NORMAL mode
  ---@type table
  toggler = {
    ---Line-comment toggle keymap
    line = '<leader>cc',
    ---Block-comment toggle keymap
    block = '<leader>bc',
  },

  ---LHS of operator-pending mappings in NORMAL + VISUAL mode
  ---@type table
  opleader = {
    ---Line-comment keymap
    line = '<leader>c',
    ---Block-comment keymap
    block = '<leader>b',
  },
  ---LHS of extra mappings
  ---@type table
  extra = {
    ---Add comment on the line above
    above = '<leader>cO',
    ---Add comment on the line below
    below = '<leader>co',
    ---Add comment at the end of line
    eol = '<leader>cA',
  },
})
