if not pcall(require, "telescope") then
  return
end

-- local sorters = require "telescope.sorters"

-- Press Ctrl-R twice after ':' to fuzzy search command history, b/c single Ctrl-R is already mapped to register
-- paste.
vim.api.nvim_set_keymap("c", "<c-r><c-r>", "<Plug>(TelescopeFuzzyCommandSearch)", { noremap = false, nowait = true })

-- FILES
vim.keymap.set("n", "<leader>e", "<cmd>lua require('merlinvn.telescope').fd()<cr>", { desc = "Files" })
vim.keymap.set('n', '<leader>tf', require('telescope.builtin').find_files, { desc = '[F]iles' })
vim.keymap.set("n", "<leader><space>", "<cmd>lua require('merlinvn.telescope').buffers()<cr>",
  { desc = "Current buffers" })
vim.keymap.set("n", "<leader>ts", "<cmd>lua require('merlinvn.telescope').grep_prompt()<cr>",
  { desc = "Global search cwd" })
vim.keymap.set("n", "<leader>tt", "<cmd>Telescope<cr>")
vim.keymap.set("n", "<leader>tp", "<cmd>lua require('merlinvn.telescope').project_files()<cr>",
  { desc = "Project files" })
vim.keymap.set("n", "<leader>to", require('telescope.builtin').oldfiles, { desc = "Find recently [o]pened files" })
vim.keymap.set("n", "<leader>tg", "<cmd>lua require('merlinvn.telescope').multi_rg()<cr>", { desc = "Live Grep" })
vim.keymap.set("n", "<leader>ta", "<cmd>lua require('merlinvn.telescope').search_all_files()<cr>", { desc = "All files" })
vim.keymap.set("n", "<leader>te", "<cmd>lua require('merlinvn.telescope').file_browser()<cr>", { desc = "File browser" })
vim.keymap.set("n", "<leader>tz", "<cmd>lua require('merlinvn.telescope').search_only_certain_files()<cr>",
  { desc = "Search by file type" })


-- SEARCH
vim.keymap.set("n", "<leader>/", "<cmd>lua require('merlinvn.telescope').curbuf()<cr>",
  { desc = "Search current buffer" })
-- search word under cursor
vim.keymap.set("n", "<leader>tw", "<cmd>lua require('merlinvn.telescope').word_under_cursor()<cr>",
  { desc = "Search word under cursor" })

-- VIM
vim.keymap.set("n", "<leader>tr", "<cmd>lua require('telescope.builtin').registers()<cr>", { desc = "Registers" })
vim.keymap.set("n", "<leader>tc", "<cmd>Telescope commands<cr>", { desc = "Commands" })
vim.keymap.set("n", "<leader>th", "<cmd>lua require('merlinvn.telescope').help_tags()<cr>", { desc = "Help tags" })
vim.keymap.set("n", "<leader>tk", "<cmd>lua require('telescope.builtin').keymaps()<cr>", { desc = "Keymaps" })
vim.keymap.set("n", "<leader>tO", "<cmd>lua require('merlinvn.telescope').vim_options()<cr>", { desc = "Vim Options" })
-- vim.keymap.set("n", "<leader>tm", "<cmd>Telescope marks<cr>", { desc = "Marks" })
vim.keymap.set("n", "<leader>t;", "<cmd>Telescope command_history<cr>", { desc = "Command history" })
vim.keymap.set("n", "<leader>t?", "<cmd>Telescope search_history<cr>", { desc = "Search history" })

vim.keymap.set("n", "<leader>td", "<cmd>lua require('merlinvn.telescope').edit_dotfiles()<cr>", { desc = "Dotfiles" })
vim.keymap.set("n", "<leader>tn", "<cmd>lua require('merlinvn.telescope').edit_neovim()<cr>", { desc = "Neovim config" })

-- search word from input

vim.keymap.set("n", "gd", ":lua require('telescope.builtin').lsp_definitions()<CR>", { desc = "Definitions" })
vim.keymap.set("n", "gi", ":lua require('telescope.builtin').lsp_implementations()<CR>", { desc = "Implementations" })
-- vim.keymap.set("n", "gt", ":lua require('telescope.builtin').lsp_type_definitions()<CR>")
-- vim.keymap.set("n", "gr", ":lua require('telescope.builtin').lsp_references()<CR>")

-- nnoremap ("gh", ":lua vim.lsp.buf.signature_help()<CR>")
-- nnoremap ("<leader>ch", ":lua vim.lsp.buf.signature_help()<CR>")
--
-- " nnoremap gs :lua vim.lsp.buf.document_symbol()<CR>
-- " nnoremap <leader>cs :lua vim.lsp.buf.document_symbol()<CR>

vim.keymap.set("n", "<leader>cs", ":lua require('telescope.builtin').lsp_document_symbols()<CR>",
  { desc = "Document symbols" })
vim.keymap.set("n", "<leader>cS", ":lua require('telescope.builtin').lsp_workspace_symbols()<CR>",
  { desc = "Workspace symbols" })
vim.keymap.set("n", "<leader>cd", ":lua require('telescope.builtin').diagnostics({bufnr=0})<CR>",
  { desc = "Document diagnostics" })
vim.keymap.set("n", "<leader>cD", ":lua require('telescope.builtin').diagnostics()<CR>",
  { desc = "Workspace diagnostics" })

-- treesitter
vim.keymap.set("n", "<leader>ts", ":lua require('telescope.builtin').treesitter()<CR>", { desc = "Treesitter" })
