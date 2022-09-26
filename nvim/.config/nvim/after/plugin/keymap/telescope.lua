if not pcall(require, "telescope") then
  return
end

-- local sorters = require "telescope.sorters"

local nnoremap = require("merlinvn.keymap").nnoremap

-- Press Ctrl-R twice after ':' to fuzzy search command history, b/c single Ctrl-R is already mapped to register
-- paste.
vim.api.nvim_set_keymap("c", "<c-r><c-r>", "<Plug>(TelescopeFuzzyCommandSearch)", { noremap = false, nowait = true })

-- FILES
nnoremap("<leader>tt", "<cmd>Telescope<cr>")
nnoremap("<leader>tf", "<cmd>lua require('merlinvn.telescope').fd()<cr>", { desc = "Files" })
nnoremap("<C-j>", "<cmd>lua require('merlinvn.telescope').fd()<cr>", { desc = "Files" })
nnoremap("<leader>tp", "<cmd>lua require('merlinvn.telescope').project_files()<cr>", { desc = "Project files" })
nnoremap("<leader>to", "<cmd>Telescope oldfiles<cr>", { desc = "Old files" })
nnoremap("<leader>tg", "<cmd>lua require('merlinvn.telescope').multi_rg()<cr>", { desc = "Live Grep" })
nnoremap("<leader>ta", "<cmd>lua require('merlinvn.telescope').search_all_files()<cr>", { desc = "All files" })
nnoremap("<leader>te", "<cmd>lua require('merlinvn.telescope').file_browser()<cr>", { desc = "File browser" })
nnoremap("<leader>tb", "<cmd>lua require('merlinvn.telescope').buffers()<cr>", { desc = "Buffers" })
nnoremap("<leader>tz", "<cmd>lua require('merlinvn.telescope').search_only_certain_files()<cr>",
  { desc = "Search by file type" })


-- SEARCH
nnoremap("<leader>t/", "<cmd>lua require('merlinvn.telescope').curbuf()<cr>", { desc = "Search current buffer" })
-- search word under cursor
nnoremap("<leader>tw", "<cmd>lua require('merlinvn.telescope').word_under_cursor()<cr>",
  { desc = "Search word under cursor" })

-- VIM
nnoremap("<leader>tr", "<cmd>lua require('telescope.builtin').registers()<cr>", { desc = "Registers" })
nnoremap("<leader>tc", "<cmd>Telescope commands<cr>", { desc = "Commands" })
nnoremap("<leader>th", "<cmd>lua require('merlinvn.telescope').help_tags()<cr>", { desc = "Help tags" })
nnoremap("<leader>tk", "<cmd>lua require('telescope.builtin').keymaps()<cr>", { desc = "Keymaps" })
nnoremap("<leader>tO", "<cmd>lua require('merlinvn.telescope').vim_options()<cr>", { desc = "Vim Options" })
-- nnoremap("<leader>tm", "<cmd>Telescope marks<cr>", { desc = "Marks" })
nnoremap("<leader>t;", "<cmd>Telescope command_history<cr>", { desc = "Command history" })
nnoremap("<leader>t?", "<cmd>Telescope search_history<cr>", { desc = "Search history" })

nnoremap("<leader>td", "<cmd>lua require('merlinvn.telescope').edit_dotfiles()<cr>", { desc = "Dotfiles" })
nnoremap("<leader>tn", "<cmd>lua require('merlinvn.telescope').edit_neovim()<cr>", { desc = "Neovim config" })

-- search word from input

nnoremap("gd", ":lua require('telescope.builtin').lsp_definitions()<CR>", { desc = "Definitions" })
nnoremap("gi", ":lua require('telescope.builtin').lsp_implementations()<CR>", { desc = "Implementations" })
-- nnoremap("gt", ":lua require('telescope.builtin').lsp_type_definitions()<CR>")
-- nnoremap("gr", ":lua require('telescope.builtin').lsp_references()<CR>")

-- nnoremap ("gh", ":lua vim.lsp.buf.signature_help()<CR>")
-- nnoremap ("<leader>ch", ":lua vim.lsp.buf.signature_help()<CR>")
--
-- " nnoremap gs :lua vim.lsp.buf.document_symbol()<CR>
-- " nnoremap <leader>cs :lua vim.lsp.buf.document_symbol()<CR>

-- nnoremap("gs", ":lua require('telescope.builtin').lsp_document_symbols()<CR>")
-- nnoremap("gS", ":lua require('telescope.builtin').lsp_workspace_symbols()<CR>")
nnoremap("<leader>d", ":lua require('telescope.builtin').diagnostics({bufnr=0})<CR>",
  { desc = "Current buffer diagnostics" })
nnoremap("<leader>D", ":lua require('telescope.builtin').diagnostics()<CR>", { desc = "Workspace diagnostics" })

-- treesitter
nnoremap("<leader>ts", ":lua require('telescope.builtin').treesitter()<CR>", { desc = "Treesitter" })
