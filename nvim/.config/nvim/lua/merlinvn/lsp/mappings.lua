local nmap = require('merlinvn.keymaps').nmap

nmap{"gD", ":lua vim.lsp.buf.declaration()<CR>"}
nmap{"<leader>cgD", ":lua vim.lsp.buf.declaration()<CR>"}

nmap{"gd", ":lua vim.lsp.buf.definition()<CR>"}
nmap{"<leader>cgd", ":lua vim.lsp.buf.definition()<CR>"}

nmap{"gi", ":lua vim.lsp.buf.implementation()<CR>"}
nmap{"<leader>cgi", ":lua vim.lsp.buf.implementation()<CR>"}

nmap{"gt", ":lua vim.lsp.buf.type_definition()<CR>"}
nmap{"<leader>cgt", ":lua vim.lsp.buf.type_definition()<CR>"}

nmap{"gh", ":lua vim.lsp.buf.signature_help()<CR>"}
nmap{"<leader>ch", ":lua vim.lsp.buf.signature_help()<CR>"}

-- " nnoremap gs :lua vim.lsp.buf.document_symbol()<CR>
-- " nnoremap <leader>cs :lua vim.lsp.buf.document_symbol()<CR>

-- " nnoremap gS :lua vim.lsp.buf.workspace_symbol()<CR>
-- " nnoremap <leader>cS :lua vim.lsp.buf.workspace_symbol()<CR>

nmap{"gs", ":lua require('telescope.builtin').lsp_document_symbols()<CR>"}
nmap{"<leader>cs", ":lua require('telescope.builtin').lsp_document_symbols()<CR>"}

nmap{"gS", ":lua require('telescope.builtin').lsp_workspace_symbols()<CR>"}
nmap{"<leader>cS", ":lua require('telescope.builtin').lsp_workspace_symbols()<CR>"}

-- " nnoremap gr :lua vim.lsp.buf.references()<CR>
-- " nnoremap <leader>cr :lua vim.lsp.buf.references()<CR>

nmap{"gr", ":lua require('telescope.builtin').lsp_references()<CR>"}
nmap{"<leader>cr", ":lua require('telescope.builtin').lsp_references()<CR>"}

-- nnoremap [d :lua vim.lsp.diagnostic.goto_prev()<CR>
-- nnoremap ]d :lua vim.lsp.diagnostic.goto_next()<CR>

nmap{"<leader>cp", ":lua vim.lsp.diagnostic.goto_prev()<CR>"}
nmap{"<leader>cn", ":lua vim.lsp.diagnostic.goto_next()<CR>"}

-- nnoremap <leader>= :lua vim.lsp.buf.formatting()<CR>
nmap{"<leader>cf", ":lua vim.lsp.buf.formatting()<CR>"}

-- " nnoremap <leader>cl :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nmap{"<leader>cd", ":lua require('telescope.builtin').lsp_document_diagnostics()<CR>"}
nmap{"<leader>cD", ":lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>"}

nmap{"K", ":lua vim.lsp.buf.hover()<CR>"}
nmap{"<leader>ck", ":lua vim.lsp.buf.hover()<CR>"}

nmap{"<leader>ce", ":lua vim.lsp.buf.rename()<CR>"}
-- " nnoremap <leader>c. :lua vim.lsp.buf.code_action()<CR>
-- nnoremap <leader>c. :lua require('telescope.builtin').lsp_code_actions()<CR>

nmap{"<leader>c.", ":lua require('telescope.builtin').lsp_code_actions()<CR>"}

nmap{"<leader>c>", ":lua require('telescope.builtin').lsp_range_code_actions()<CR>"}

nmap{"<leader>ci", ":lua vim.lsp.buf.incoming_calls()<CR>"}
nmap{"<leader>co", ":lua vim.lsp.buf.outgoing_calls()<CR>"}
