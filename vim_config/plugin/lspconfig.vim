if has('nvim')
  " lspconfig settings
  set completeopt=menuone,noinsert,noselect

  let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua << EOF
  require'lspconfig'.clangd.setup{
    on_attach=require'completion'.on_attachustom_attach;
    cmd = { "clangd", "--background-index"};
  }
EOF

  lua require'lspconfig'.gopls.setup{ on_attach=require'completion'.on_attach }
  " lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
  " lua require'lspconfig'.pyls.setup{ on_attach=require'completion'.on_attach }
  " lua require'lspconfig'.rust_analyzer.setup{ on_attach=require'completion'.on_attach }
  " lua require'nvim_lsp'.sumneko_lua.setup{ on_attach=require'completion'.on_attach }

  nnoremap gD <cmd>lua vim.lsp.buf.declaration()<CR>
  nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap gi <cmd>lua vim.lsp.buf.implementation()<CR>
  nnoremap gs <cmd>lua vim.lsp.buf.signature_help()<CR>
  " nnoremap gt <cmd>lua vim.lsp.buf.type_definition()<CR>
  nnoremap gw <cmd>lua vim.lsp.buf.document_symbol()<CR>
  nnoremap gW <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

  nnoremap gr <cmd>lua vim.lsp.buf.references()<CR>

  nnoremap [d <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
  nnoremap ]d <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
  nnoremap <leader>= <cmd>lua vim.lsp.buf.formatting()<CR>

  nnoremap <leader>ee <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>

  nnoremap <leader>ar <cmd>lua vim.lsp.buf.rename()<CR>
  nnoremap <leader>a. <cmd>lua vim.lsp.buf.code_action()<CR>
  nnoremap <leader>ai <cmd>lua vim.lsp.buf.incoming_calls()<CR>
  nnoremap <leader>ao <cmd>lua vim.lsp.buf.outgoing_calls()<CR>


  imap <tab> <Plug>(completion_smart_tab)
  imap <s-tab> <Plug>(completion_smart_s_tab)

endif


