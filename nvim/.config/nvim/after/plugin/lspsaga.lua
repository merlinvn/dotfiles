local status, saga = pcall(require, "lspsaga")
if (not status) then return end
local action = require("lspsaga.codeaction")

saga.init_lsp_saga {
  server_filetype_map = {
    typescript = 'typescript'
  },

  finder_action_keys = {
    open = "o",
    vsplit = "v",
    split = "x",
    tab = "t",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>", -- quit can be a table
  },
}
local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'gn', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
vim.keymap.set('n', 'H', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gf', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('i', '<C-h>', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set('n', 'gv', '<Cmd>Lspsaga preview_definition<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)

-- code action
vim.keymap.set("n", "<leader>.", action.code_action, { silent = true })
vim.keymap.set("v", "<leader>.", function()
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
  action.range_code_action()
end, { silent = true })