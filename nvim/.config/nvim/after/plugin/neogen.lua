require('neogen').setup {}

vim.api.nvim_set_keymap("n", "<Leader>cg", ":lua require('neogen').generate()<CR>",
  { noremap = true, silent = true, desc = "Generate docs" })
