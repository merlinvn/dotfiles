local map = require("utils").map
map("n", "gD", ":lua vim.lsp.buf.declaration()<CR>")
map("n", "<leader>cgD", ":lua vim.lsp.buf.declaration()<CR>")

map("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
map("n", "<leader>cgd", ":lua vim.lsp.buf.definition()<CR>")

map("n", "gi", ":lua vim.lsp.buf.implementation()<CR>")
map("n", "<leader>cgi", ":lua vim.lsp.buf.implementation()<CR>")

map("n", "gt", ":lua vim.lsp.buf.type_definition()<CR>")
map("n", "<leader>cgt", ":lua vim.lsp.buf.type_definition()<CR>")

map("n", "gh", ":lua vim.lsp.buf.signature_help()<CR>")
map("n", "<leader>ch", ":lua vim.lsp.buf.signature_help()<CR>")

-- " nnoremap gs :lua vim.lsp.buf.document_symbol()<CR>
-- " nnoremap <leader>cs :lua vim.lsp.buf.document_symbol()<CR>

-- " nnoremap gS :lua vim.lsp.buf.workspace_symbol()<CR>
-- " nnoremap <leader>cS :lua vim.lsp.buf.workspace_symbol()<CR>

map("n", "gs", ":lua require('telescope.builtin').lsp_document_symbols()<CR>")
map("n", "<leader>cs", ":lua require('telescope.builtin').lsp_document_symbols()<CR>")

map("n", "gS", ":lua require('telescope.builtin').lsp_workspace_symbols()<CR>")
map("n", "<leader>cS", ":lua require('telescope.builtin').lsp_workspace_symbols()<CR>")

-- " nnoremap gr :lua vim.lsp.buf.references()<CR>
-- " nnoremap <leader>cr :lua vim.lsp.buf.references()<CR>

map("n", "gr", ":lua require('telescope.builtin').lsp_references()<CR>")
map("n", "<leader>cr", ":lua require('telescope.builtin').lsp_references()<CR>")

-- nnoremap [d :lua vim.lsp.diagnostic.goto_prev()<CR>
-- nnoremap ]d :lua vim.lsp.diagnostic.goto_next()<CR>

map("n", "<leader>cp", ":lua vim.lsp.diagnostic.goto_prev()<CR>")
map("n", "<leader>cn", ":lua vim.lsp.diagnostic.goto_next()<CR>")

-- nnoremap <leader>= :lua vim.lsp.buf.formatting()<CR>
map("n", "<leader>cf", ":lua vim.lsp.buf.formatting()<CR>")

-- " nnoremap <leader>cl :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
map("n", "<leader>cd", ":lua require('telescope.builtin').lsp_document_diagnostics()<CR>")
map("n", "<leader>cD", ":lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>")

map("n", "K", ":lua vim.lsp.buf.hover()<CR>")
map("n", "<leader>ck", ":lua vim.lsp.buf.hover()<CR>")

map("n", "<leader>ce", ":lua vim.lsp.buf.rename()<CR>")
-- " nnoremap <leader>c. :lua vim.lsp.buf.code_action()<CR>
-- nnoremap <leader>c. :lua require('telescope.builtin').lsp_code_actions()<CR>

map("n", "<leader>c.", ":lua require('telescope.builtin').lsp_code_actions()<CR>")

map("n", "<leader>c>", ":lua require('telescope.builtin').lsp_range_code_actions()<CR>")

map("n", "<leader>ci", ":lua vim.lsp.buf.incoming_calls()<CR>")
map("n", "<leader>co", ":lua vim.lsp.buf.outgoing_calls()<CR>")
