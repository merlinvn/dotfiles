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
nnoremap("<leader>tf", "<cmd>lua require('merlinvn.telescope').fd()<cr>")
nnoremap("<leader>tp", "<cmd>lua require('merlinvn.telescope').project_files()<cr>")
nnoremap("<leader>to", "<cmd>Telescope oldfiles<cr>")
nnoremap("<leader>tg", "<cmd>lua require('merlinvn.telescope').multi_rg()<cr>")
nnoremap("<leader>ta", "<cmd>lua require('merlinvn.telescope').search_all_files()<cr>")
nnoremap("<leader>te", "<cmd>lua require('merlinvn.telescope').file_browser()<cr>")
nnoremap("<leader>tb", "<cmd>lua require('merlinvn.telescope').buffers()<cr>")
nnoremap("<leader>tz", "<cmd>lua require('merlinvn.telescope').search_only_certain_files()<cr>")


-- SEARCH
-- nnoremap("<leader>t/", "<cmd>lua require('merlinvn.telescope').curbuf()<cr>")
-- search word under cursor
nnoremap("<leader>tw", "<cmd>lua require('merlinvn.telescope').word_under_cursor()<cr>")

-- VIM
nnoremap("<leader>tr", "<cmd>lua require('telescope.builtin').registers()<cr>")
nnoremap("<leader>tc", "<cmd>Telescope commands<cr>")
nnoremap("<leader>th", "<cmd>lua require('merlinvn.telescope').help_tags()<cr>")
nnoremap("<leader>tk", "<cmd>lua require('telescope.builtin').keymaps()<cr>")
nnoremap("<leader>tO", "<cmd>lua require('merlinvn.telescope').vim_options()<cr>")
nnoremap("<leader>tm", "<cmd>Telescope marks<cr>")
nnoremap("<leader>t;", "<cmd>Telescope command_history<cr>")
nnoremap("<leader>t?", "<cmd>Telescope search_history<cr>")

nnoremap("<leader>td", "<cmd>lua require('merlinvn.telescope').edit_dotfiles()<cr>")
nnoremap("<leader>tn", "<cmd>lua require('merlinvn.telescope').edit_neovim()<cr>")

-- search word from input

nnoremap("gd", ":lua require('telescope.builtin').lsp_definitions()<CR>")
nnoremap("gi", ":lua require('telescope.builtin').lsp_implementations()<CR>")
-- nnoremap("gt", ":lua require('telescope.builtin').lsp_type_definitions()<CR>")
-- nnoremap("gr", ":lua require('telescope.builtin').lsp_references()<CR>")

-- nnoremap ("gh", ":lua vim.lsp.buf.signature_help()<CR>")
-- nnoremap ("<leader>ch", ":lua vim.lsp.buf.signature_help()<CR>")
--
-- " nnoremap gs :lua vim.lsp.buf.document_symbol()<CR>
-- " nnoremap <leader>cs :lua vim.lsp.buf.document_symbol()<CR>

nnoremap("gs", ":lua require('telescope.builtin').lsp_document_symbols()<CR>")
nnoremap("gS", ":lua require('telescope.builtin').lsp_workspace_symbols()<CR>")
nnoremap("<leader>d", ":lua require('telescope.builtin').diagnostics({bufnr=0})<CR>")
nnoremap("<leader>D", ":lua require('telescope.builtin').diagnostics()<CR>")
