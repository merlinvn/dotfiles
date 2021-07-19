require'lspconfig'.clangd.setup{
    on_attach=require'completion'.on_attach;
    cmd = { "clangd", "--background-index"};
}

require'lspconfig'.gopls.setup{ on_attach=require'completion'.on_attach }

-- require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
-- require'lspconfig'.pyls.setup{ on_attach=require'completion'.on_attach }
-- require'lspconfig'.rust_analyzer.setup{ on_attach=require'completion'.on_attach }
-- require'nvim_lsp'.sumneko_lua.setup{ on_attach=require'completion'.on_attach }


require('merlinvn.lspkind').init()


