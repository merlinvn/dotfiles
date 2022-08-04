vim.g.copilot_no_tab_map = true
vim.g.copilot_node_command = "~/.volta/bin/node"
vim.api.nvim_set_keymap("i", "<C-L>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
