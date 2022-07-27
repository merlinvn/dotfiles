vim.api.nvim_set_keymap("i", "<C-L>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.g.copilot_no_tab_map = true
