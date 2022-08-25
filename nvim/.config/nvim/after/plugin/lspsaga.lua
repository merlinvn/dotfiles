local status, saga = pcall(require, "lspsaga")
if (not status) then return end

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
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gf', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('n', 'gv', '<Cmd>Lspsaga preview_definition<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)

-- Code action
vim.keymap.set("n", "<leader>.", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set("v", "<leader>.", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true })

-- scroll in hover doc or definition preview window
local action = require("lspsaga.action")
vim.keymap.set("n", "<C-f>", function()
  action.smart_scroll_with_saga(1)
end, { silent = true })
-- scroll in hover doc or definition preview window
vim.keymap.set("n", "<C-b>", function()
  action.smart_scroll_with_saga(-1)
end, { silent = true })
