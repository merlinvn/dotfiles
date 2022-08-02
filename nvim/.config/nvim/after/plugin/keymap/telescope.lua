if not pcall(require, "telescope") then
  return
end

local sorters = require "telescope.sorters"

local nnoremap = require("merlinvn.keymap").nnoremap

-- Press Ctrl-R twice after ':' to fuzzy search command history, b/c single Ctrl-R is already mapped to register
-- paste.
vim.api.nvim_set_keymap("c", "<c-r><c-r>", "<Plug>(TelescopeFuzzyCommandSearch)", { noremap = false, nowait = true })


-- SEARCH
-- search word under cursor

-- search word from input

nnoremap("gd", ":lua require('telescope.builtin').lsp_definitions()<CR>")
nnoremap("gi", ":lua require('telescope.builtin').lsp_implementations()<CR>")
nnoremap("gt", ":lua require('telescope.builtin').lsp_type_definitions()<CR>")
nnoremap("gr", ":lua require('telescope.builtin').lsp_references()<CR>")

-- nnoremap ("gh", ":lua vim.lsp.buf.signature_help()<CR>")
-- nnoremap ("<leader>ch", ":lua vim.lsp.buf.signature_help()<CR>")
--
-- " nnoremap gs :lua vim.lsp.buf.document_symbol()<CR>
-- " nnoremap <leader>cs :lua vim.lsp.buf.document_symbol()<CR>

nnoremap("gs", ":lua require('telescope.builtin').lsp_document_symbols()<CR>")
nnoremap("gS", ":lua require('telescope.builtin').lsp_workspace_symbols()<CR>")
nnoremap("<leader>d", ":lua require('telescope.builtin').diagnostics({bufnr=0})<CR>")
nnoremap("<leader>D", ":lua require('telescope.builtin').diagnostics()<CR>")

-- nnoremap [d :lua vim.lsp.diagnostic.goto_prev()<CR>
-- nnoremap ]d :lua vim.lsp.diagnostic.goto_next()<CR>

-- nnoremap ("<leader>cp", ":lua vim.lsp.diagnostic.goto_prev()<CR>")
-- nnoremap ("<leader>cn", ":lua vim.lsp.diagnostic.goto_next()<CR>")

-- nnoremap <leader>= :lua vim.lsp.buf.formatting()<CR>
-- nnoremap ("<leader>cf", ":lua vim.lsp.buf.formatting()<CR>")

-- " nnoremap <leader>cl :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>

-- nnoremap ("K", ":lua vim.lsp.buf.hover()<CR>")
-- nnoremap ("<leader>ck", ":lua vim.lsp.buf.hover()<CR>")

-- nnoremap ("<leader>ce", ":lua vim.lsp.buf.rename()<CR>")
-- " nnoremap <leader>c. :lua vim.lsp.buf.code_action()<CR>

-- nnoremap ("<leader>c>", ":lua require('telescope.builtin').lsp_range_code_actions()<CR>")

-- nnoremap ("<leader>ci", ":lua vim.lsp.buf.incoming_calls()<CR>")
-- nnoremap ("<leader>co", ":lua vim.lsp.buf.outgoing_calls()<CR>")
