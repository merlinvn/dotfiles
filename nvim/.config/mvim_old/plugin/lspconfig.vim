if has('nvim')

  inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  " imap <tab> <Plug>(completion_smart_tab)
  " imap <s-tab> <Plug>(completion_smart_s_tab)

  " lspconfig settings
  set completeopt=menuone,noinsert,noselect
  let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
  let g:completion_enable_snippet = 'UltiSnips'

  lua require'merlinvn.lspconfig'

  nnoremap gD <cmd>lua vim.lsp.buf.declaration()<CR>
  nnoremap <leader>cgD <cmd>lua vim.lsp.buf.declaration()<CR>

  nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <leader>cgd <cmd>lua vim.lsp.buf.definition()<CR>

  nnoremap gi <cmd>lua vim.lsp.buf.implementation()<CR>
  nnoremap <leader>cgi <cmd>lua vim.lsp.buf.implementation()<CR>

  nnoremap gt <cmd>lua vim.lsp.buf.type_definition()<CR>
  nnoremap <leader>cgt <cmd>lua vim.lsp.buf.type_definition()<CR>

  nnoremap gh <cmd>lua vim.lsp.buf.signature_help()<CR>
  nnoremap <leader>ch <cmd>lua vim.lsp.buf.signature_help()<CR>

  " nnoremap gs <cmd>lua vim.lsp.buf.document_symbol()<CR>
  " nnoremap <leader>cs <cmd>lua vim.lsp.buf.document_symbol()<CR>

  " nnoremap gS <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
  " nnoremap <leader>cS <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

  nnoremap gs <cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>
  nnoremap <leader>cs <cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>

  nnoremap gS <cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>
  nnoremap <leader>cS <cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>

  " nnoremap gr <cmd>lua vim.lsp.buf.references()<CR>
  " nnoremap <leader>cr <cmd>lua vim.lsp.buf.references()<CR>

  nnoremap gr <cmd>lua require('telescope.builtin').lsp_references()<CR>
  nnoremap <leader>cr <cmd>lua require('telescope.builtin').lsp_references()<CR>

  nnoremap [d <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
  nnoremap ]d <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

  nnoremap <leader>cp <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
  nnoremap <leader>cn <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

  nnoremap <leader>= <cmd>lua vim.lsp.buf.formatting()<CR>
  nnoremap <leader>cf <cmd>lua vim.lsp.buf.formatting()<CR>

  " nnoremap <leader>cl <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
  nnoremap <leader>cd <cmd>lua require('telescope.builtin').lsp_document_diagnostics()<CR>
  nnoremap <leader>cD <cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>


  nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <leader>ck <cmd>lua vim.lsp.buf.hover()<CR>

  nnoremap <leader>ce <cmd>lua vim.lsp.buf.rename()<CR>
  " nnoremap <leader>c. <cmd>lua vim.lsp.buf.code_action()<CR>
  nnoremap <leader>c. <cmd>lua require('telescope.builtin').lsp_code_actions()<CR>
  nnoremap <leader>c> <cmd>lua require('telescope.builtin').lsp_range_code_actions()<CR>

  nnoremap <leader>ci <cmd>lua vim.lsp.buf.incoming_calls()<CR>
  nnoremap <leader>co <cmd>lua vim.lsp.buf.outgoing_calls()<CR>

endif


