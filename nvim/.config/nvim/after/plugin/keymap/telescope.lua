if not pcall(require, "telescope") then
  return
end

local telescope_prefix = "<leader>f"

local map_telescope = function(lhs, rhs, opts)
  vim.keymap.set("n", telescope_prefix .. lhs, rhs, opts)
end
-- local sorters = require "telescope.sorters"

-- Press Ctrl-R twice after ':' to fuzzy search command history, b/c single Ctrl-R is already mapped to register
-- paste.
vim.api.nvim_set_keymap("c", "<c-r><c-r>", "<Plug>(TelescopeFuzzyCommandSearch)", { noremap = false, nowait = true })
-- vim.keymap.set("n", "<leader><space>", require('merlinvn.telescope').buffers,  { desc = "Current buffers" })
vim.keymap.set("n", "<leader><space>", require('telescope.builtin').buffers,  { desc = "Current buffers" })

-- FILES
vim.keymap.set("n", "<leader>e", require('merlinvn.telescope').find_files(), { desc = "Files / Project files" })

map_telescope("f", require('merlinvn.telescope').find_files(), { desc = "Files / Project files" })
map_telescope("s", "<cmd>lua require('merlinvn.telescope').grep_prompt()<cr>",
  { desc = "Global search cwd" })
map_telescope("t", "<cmd>Telescope<cr>")
map_telescope("b", require('telescope.builtin').buffers, { desc = "[B]uffers" })
map_telescope("o", require('telescope.builtin').oldfiles, { desc = "[O]ld files" })
map_telescope("g", "<cmd>lua require('merlinvn.telescope').multi_rg()<cr>", { desc = "Live [G]rep" })
map_telescope("a", require('merlinvn.telescope').search_all_files, { desc = "[A]ll files" })
map_telescope("e", "<cmd>lua require('merlinvn.telescope').file_browser()<cr>", { desc = "Fil[e] browser" })
map_telescope("z", "<cmd>lua require('merlinvn.telescope').search_only_certain_files()<cr>",
  { desc = "Search by file type" })


-- SEARCH
vim.keymap.set("n", "<leader>/", "<cmd>lua require('merlinvn.telescope').curbuf()<cr>",
  { desc = "Search current buffer" })
-- search word under cursor
map_telescope("w", "<cmd>lua require('merlinvn.telescope').word_under_cursor()<cr>",
  { desc = "Search word under cursor" })

-- VIM
map_telescope("r", "<cmd>lua require('telescope.builtin').registers()<cr>", { desc = "[R]egisters" })
map_telescope("c", "<cmd>Telescope commands<cr>", { desc = "Commands" })
map_telescope("h", "<cmd>lua require('merlinvn.telescope').help_tags()<cr>", { desc = "[H]elp tags" })
map_telescope("k", "<cmd>lua require('telescope.builtin').keymaps()<cr>", { desc = "[K]eymaps" })
map_telescope("O", "<cmd>lua require('merlinvn.telescope').vim_options()<cr>", { desc = "Vim Options" })
-- map_telescope("m", "<cmd>Telescope marks<cr>", { desc = "Marks" })
map_telescope(";", "<cmd>Telescope command_history<cr>", { desc = "Command history" })
map_telescope("?", "<cmd>Telescope search_history<cr>", { desc = "Search history" })

map_telescope("d", "<cmd>lua require('merlinvn.telescope').edit_dotfiles()<cr>", { desc = "Dotfiles" })
map_telescope("n", "<cmd>lua require('merlinvn.telescope').edit_neovim()<cr>", { desc = "Neovim config" })

-- search word from input

vim.keymap.set("n", "gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", { desc = "Definitions" })
vim.keymap.set("n", "gI", "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>", { desc = "Implementations" })
vim.keymap.set("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", { desc = "References" })
-- vim.keymap.set("n", "gt", "<cmd>lua require('telescope.builtin').lsp_type_definitions()<CR>")

-- nnoremap ("gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
-- nnoremap ("<leader>ch", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
--
-- " nnoremap gs <cmd>lua vim.lsp.buf.document_symbol()<CR>
-- " nnoremap <leader>cs <cmd>lua vim.lsp.buf.document_symbol()<CR>

vim.keymap.set("n", "<leader>cs", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>",
  { desc = "Document symbols" })
vim.keymap.set("n", "<leader>cS", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>",
  { desc = "Workspace symbols" })
vim.keymap.set("n", "<leader>cd", "<cmd>lua require('telescope.builtin').diagnostics({bufnr=0})<CR>",
  { desc = "Document diagnostics" })
vim.keymap.set("n", "<leader>cD", "<cmd>lua require('telescope.builtin').diagnostics()<CR>",
  { desc = "Workspace diagnostics" })

-- treesitter
map_telescope("s", "<cmd>lua require('telescope.builtin').treesitter()<CR>", { desc = "Treesitter" })
